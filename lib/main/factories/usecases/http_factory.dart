import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:service_desk_2/data/http/http_client.dart';
import 'package:mocktail/mocktail.dart';

//todo: implements httpclient
class MockHttpClient extends Mock implements HttpClient {}

HttpClient makeHttpAdapter() {
  var mockHttpClient = MockHttpClient();
  var account = {
    "account": {
      "id": "some-id",
      "name": "some-name",
      "profile_url": "some_profile_url"
    }
  };
  when(() =>
          mockHttpClient.post(url: any(named: "url"), body: any(named: "body")))
      .thenAnswer(
    (_) async {
      await Future.delayed(const Duration(seconds: 2), () {});
      throw HttpError.badRequest;
    },
  );
  return mockHttpClient;
}
