import 'dart:convert';
import 'dart:io';

import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/rendering.dart';
import 'package:fpdart/src/either.dart';

import '../../data/data.dart';
import 'package:http/http.dart' as http;

class HttpAdapter implements HttpClient {
  http.Client client;
  LoadCurrentAccountUsecase currentAccount;

  HttpAdapter({
    required this.client,
    required this.currentAccount,
  });

  Future<String?> getAuthorization() async {
    final account = await currentAccount.load();
    return account?.token;
  }

  @override
  Future<HttpResponse<T>> get<T>({
    required String url,
    Map? headers,
    Duration? timeout,
  }) async {
    try {
      final authorization = await getAuthorization();
      final requestHeaders = headers?.cast<String, String>() ??
          {
            'content-type': 'application/json',
            'accept': 'application/json',
          }
        ..addAll((authorization == null || authorization.length <= 2)
            ? {}
            : {"Authorization": "Bearer " + authorization});

      var response = await client
          .get(
            Uri.parse(url),
            headers: requestHeaders,
          )
          .timeout(timeout ?? Duration(seconds: 5));

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
      final authorization = await getAuthorization();
      print(authorization);
      var response = await client
          .post(Uri.parse(url),
              body: jsonEncode(body),
              headers: headers?.cast<String, String>() ??
                  {
                    'content-type': 'application/json',
                    'accept': 'application/json',
                  }
                ..addAll((authorization == null || authorization.length <= 2)
                    ? {}
                    : {"Authorization": "Bearer " + authorization}))
          .timeout(timeout ?? Duration(seconds: 5));

      final responseBody = response.body.length == 0 ? "{}" : response.body;
      debugPrint(response.statusCode.toString());
      return HttpResponse(
        statuscode: response.statusCode,
        body: json.decode(responseBody),
      );
    } catch (e) {
      debugPrint("error-something: " + e.toString());
      return HttpResponse(statuscode: 500);
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
          : {"Authorization": "Bearer " + authorization});
  }

  Future<HttpResponse<T>> delete<T>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  }) async {
    try {
      var response = await client
          .delete(Uri.parse(url),
              body: jsonEncode(body), headers: await _buildHeaders(headers))
          .timeout(timeout ?? Duration(seconds: 5));

      final responseBody = response.body.length == 0 ? "{}" : response.body;

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
      final request = http.MultipartRequest(method, Uri.parse(url));

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
    } catch (e) {}

    return Either.left(DomainError.unexpected);
  }
}
