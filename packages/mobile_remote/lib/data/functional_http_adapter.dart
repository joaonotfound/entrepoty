import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';

import 'package:http/http.dart' as http;
import 'package:mobile_remote/helpers/ensure_valid_domain.dart';
import 'package:mobile_remote/helpers/handle_exception.dart';
import 'package:mobile_remote/helpers/helpers.dart';
import 'package:mobile_settings/mobile_settings.dart';

import '../domain/domain.dart';

class FunctionalHttpAdapter implements FunctionalHttpClientUsecase {
  http.Client client;
  LoadCurrentAccountUsecase currentAccount;
  LoadCurrentBackendSettings loadBackendSettings;

  FunctionalHttpAdapter({
    required this.client,
    required this.currentAccount,
    required this.loadBackendSettings,
  });

  Future<String?> getAuthorization() async {
    final account = await currentAccount.load();
    return account?.token;
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
          : {"Authorization": "Bearer $authorization"});
  }

  Future<Either<DomainError, String>> loadBaseUrl() async {
    final backendSettings =
        await loadBackendSettings.loadCurrentBackendSettings();
    return backendSettings.fold(
      (error) => Either.left(DomainError.unexpected),
      (settings) => Either.right(
          "${ensureValidDomain(settings.domain)}:${settings.port}"),
    );
  }

  @override
  Future<Either<HttpErrorEnum, HttpResponse<R>>> get<R>({
    required String url,
    Map? headers,
    Duration? timeout,
  }) =>
      handleException(() async {
        final baseUrl = (await loadBaseUrl()).getOrElse((error) => "-1");

        var response = await client
            .get(Uri.parse(baseUrl + url),
                headers: await _buildHeaders(headers))
            .timeout(timeout ?? const Duration(seconds: 5));

        return handleResponse(response);
      });

  @override
  Future<Either<HttpErrorEnum, HttpResponse<T>>> post<T>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  }) =>
      handleException(() async {
        final baseUrl = (await loadBaseUrl()).getOrElse((error) => "-1");

        var response = await client
            .post(Uri.parse(baseUrl + url),
                body: jsonEncode(body), headers: await _buildHeaders(headers))
            .timeout(
              timeout ?? const Duration(seconds: 5),
            );

        return handleResponse(response);
      });

  @override
  Future<Either<HttpErrorEnum, HttpResponse<T>>> delete<T>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  }) =>
      handleException(() async {
        final baseUrl = (await loadBaseUrl()).getOrElse((error) => "-1");
        var response = await client
            .delete(Uri.parse(baseUrl + url),
                body: jsonEncode(body), headers: await _buildHeaders(headers))
            .timeout(timeout ?? const Duration(seconds: 5));

        return handleResponse(response);
      });

  @override
  Future<Either<HttpErrorEnum, HttpResponse<T>>> multiples<T>({
    required String method,
    required String url,
    List<MultipleData>? data,
    List<MultipleFile>? files,
  }) =>
      handleException(() async {
        final baseUrl = (await loadBaseUrl()).getOrElse((error) => "-1");
        final request = http.MultipartRequest(method, Uri.parse(baseUrl + url));

        for (var file in files ?? [] as List<MultipleFile>) {
          final content =
              await http.MultipartFile.fromPath(file.name, file.filePath);
          request.files.add(content);
        }

        for (var data in data ?? [] as List<MultipleData>) {
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
      });
}
