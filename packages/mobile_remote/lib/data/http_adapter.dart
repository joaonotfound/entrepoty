import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_core/domain/domain.dart';
import 'package:mobile_settings/mobile_settings.dart';

import '../domain/domain.dart';

class HttpAdapter { //implements HttpClient {
  http.Client client;
  LoadCurrentAccountUsecase currentAccount;
  LoadCurrentBackendSettings loadBackendSettings;

  HttpAdapter({
    required this.client,
    required this.currentAccount,
    required this.loadBackendSettings,
  });

  Future<String?> getAuthorization() async {
    final account = await currentAccount.load();
    return account?.token;
  }

  String getDomain(String domain) {
    if (domain.startsWith('https://') || domain.startsWith('http://')) {
      return domain;
    }
    return 'http://$domain';
  }

  Future<Either<DomainError, String>> loadBaseUrl() async {
    final backendSettings =
        await loadBackendSettings.loadCurrentBackendSettings();
    return backendSettings.fold(
      (error) => Either.left(DomainError.unexpected),
      (settings) =>
          Either.right('${getDomain(settings.domain)}:${settings.port}'),
    );
  }

  @override
  Future<HttpResponse<T>> get<T>({
    required String url,
    Map? headers,
    Duration? timeout,
  }) async {
    try {
      final baseUrl = (await loadBaseUrl()).getOrElse((error) => '-1');

      final response = await client
          .get(
            Uri.parse(baseUrl + url),
            headers: await _buildHeaders(headers),
          )
          .timeout(timeout ?? const Duration(seconds: 5));

      print('body: ${response.statusCode}');
      print('statuscode: ${response.statusCode}');

      return HttpResponse(
        statuscode: response.statusCode,
        body: response.body.runtimeType == String
            ? json.decode(response.body)
            : response.body,
      );
    } catch (e) {
      return const HttpResponse(statuscode: 500);
    }
  }

  Future<HttpResponse<T>> post<T>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  }) async {
    try {
      final baseUrl = (await loadBaseUrl()).getOrElse((error) => '-1');

      final response = await client
          .post(Uri.parse(baseUrl + url),
              body: jsonEncode(body), headers: await _buildHeaders(headers),)
          .timeout(timeout ?? const Duration(seconds: 5));

      final responseBody = response.body.isEmpty ? '{}' : response.body;
      debugPrint(response.statusCode.toString());
      return HttpResponse(
        statuscode: response.statusCode,
        body: json.decode(responseBody),
      );
    } catch (e) {
      debugPrint('error-something: $e');
      return const HttpResponse(statuscode: 500);
    }
  }

  Future<Map<String, String>> _buildHeaders(Map? headers) async {
    final authorization = await getAuthorization();
    return headers?.cast<String, String>() ??
        {
          'content-type': 'application/json',
          'accept': 'application/json',
        }
      ..addAll((authorization == null || authorization.length <= 2)
          ? {}
          : {'Authorization': 'Bearer $authorization'},);
  }

  Future<HttpResponse<T>> delete<T>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  }) async {
    try {
      final baseUrl = (await loadBaseUrl()).getOrElse((error) => '-1');
      final response = await client
          .delete(Uri.parse(baseUrl + url),
              body: jsonEncode(body), headers: await _buildHeaders(headers),)
          .timeout(timeout ?? const Duration(seconds: 5));

      final responseBody = response.body.isEmpty ? '{}' : response.body;

      return HttpResponse(
        statuscode: response.statusCode,
        body: json.decode(responseBody),
      );
    } catch (e) {
      return const HttpResponse(statuscode: 500);
    }
  }

  Future<Either<DomainError, HttpResponse<T>>> multiples<T>({
    required String method,
    required String url,
    List<MultipleData>? data,
    List<MultipleFile>? files,
  }) async {
    try {
      final baseUrl = (await loadBaseUrl()).getOrElse((error) => '-1');
      final request = http.MultipartRequest(method, Uri.parse(baseUrl + url));

      for (final file in files ?? [] as List<MultipleFile>) {
        final content =
            await http.MultipartFile.fromPath(file.name, file.filePath);
        request.files.add(content);
      }

      for (final data in data ?? [] as List<MultipleData>) {
        request.fields[data.name] = data.content;
      }

      request.headers.addAll(await _buildHeaders(null));

      final response = await request.send();
      final body = json.decode(await response.stream.bytesToString());
      return Either.right(
        HttpResponse(
          statuscode: response.statusCode,
          body: body,
        ),
      );
    } catch (e) {
      print('error on http_adapter: $e');
    }

    return Either.left(DomainError.unexpected);
  }
}

