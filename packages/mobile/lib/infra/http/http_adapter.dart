import 'dart:convert';

import 'package:flutter/rendering.dart';

import '../../data/data.dart';
import 'package:http/http.dart' as http;

class HttpAdapter implements HttpClient {
  http.Client client;

  HttpAdapter({
    required this.client,
  });

  @override
  Future<HttpResponse<T>> get<T>({
    required String url,
    Map? headers,
    Duration? timeout,
  }) async {
    try {
      var response = await client
          .get(
            Uri.parse(url),
            headers: headers?.cast<String, String>() ??
                {
                  'content-type': 'application/json',
                  'accept': 'application/json',
                },
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
      var response = await client
          .post(
            Uri.parse(url),
            body: jsonEncode(body),
            headers: headers?.cast<String, String>() ??
                {
                  'content-type': 'application/json',
                  'accept': 'application/json',
                },
          )
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
