import 'dart:convert';

import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/rendering.dart';

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
      var response = await client
          .get(
            Uri.parse(url),
            headers: headers?.cast<String, String>() ??
                {
                  'content-type': 'application/json',
                  'accept': 'application/json',
                }
              ..addAll((authorization == null || authorization.length <= 2)
                  ? {}
                  : {"Authorization": "Bearer " + authorization}),
          )
          .timeout(
            timeout ?? Duration(seconds: 5),
          );
      return HttpResponse(
        statuscode: response.statusCode,
        body: json.decode(response.body),
      );
    } catch (e) {
      return const HttpResponse(statuscode: 500);
    }
  }

  @override
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
      return const HttpResponse(statuscode: 500);
    }
  }
}
