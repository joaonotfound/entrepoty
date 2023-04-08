import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';
import 'package:mobile_settings/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../mobile_core/mobile_core.dart';
import '../../mobile_settings/domain/domain.dart';
import 'infra.dart';

void main() {
  late HttpAdapter sut;
  late ClientMock client;
  late MockLoadCurrentAccount currentAccount;
  late MockLoadBackendSettings loadBackendSettings;
  var url = 'https://domain.com:8080';
  var path = "/path";

  setUpAll(() {
    registerFallbackValue(Uri.parse(path));
  });
  setUp(() {
    client = ClientMock();
    client.mockGet(http.Response("{}", 200));
    client.mockPost(http.Response("{}", 200));
    currentAccount = MockLoadCurrentAccount();
    currentAccount.mockLoad(TokenAccount(token: ""));
    loadBackendSettings = MockLoadBackendSettings();
    loadBackendSettings.mockLoad(
      Either.right(
        BackendSettings(
          domain: "https://domain.com",
          port: 8080,
        ),
      ),
    );
    sut = HttpAdapter(
      client: client,
      currentAccount: currentAccount,
      loadBackendSettings: loadBackendSettings,
    );
  });

  group("HttpAdapter get", () {
    test("should call client with correct url", () async {
      await sut.get(url: path);

      verify(() => client.get(
            Uri.parse(url + path),
            headers: {
              'content-type': 'application/json',
              'accept': 'application/json',
            },
          )).called(1);
    });
    test("should return correct status code", () async {
      client.mockGet(http.Response("{}", 300));

      var response = await sut.get(url: path);

      expect(response.statuscode, 300);
    });
    test("should return correct body", () async {
      client.mockGet(http.Response("{ \"username\": \"any-username\" }", 200));

      var response = await sut.get(url: path);

      expect(response.body, {"username": "any-username"});
      expect(response.statuscode, 200);
    });
    test("should return 500 error if client throws", () async {
      client.mockGetThrows();

      var response = await sut.get(url: path);

      expect(response.statuscode, 500);
    });
    test("should call client with defaults headers", () async {
      await sut.get(url: path);

      verify(() => client.get(Uri.parse(url + path), headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          })).called(1);
    });
    test("should call client with right headers", () async {
      await sut.get(url: path, headers: {
        'content-type': 'application/json',
        'accept': 'application/xml'
      });

      verify(() => client.get(Uri.parse(url + path), headers: {
            'content-type': 'application/json',
            'accept': 'application/xml'
          })).called(1);
    });
  });
  group("HttpAdapter post", () {
    test("should call client with correct values", () async {
      await sut.post(url: path, body: {"key": "value"});

      verify(
        () => client.post(
          Uri.parse(url + path),
          body: jsonEncode({"key": "value"}),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json',
          },
        ),
      ).called(1);
    });
    test("should return correct response", () async {
      client.mockPost(http.Response("{ \"any-key\": \"any-value\"}", 200));

      var response = await sut.post(url: path);

      expect(response.statuscode, 200);
      expect(response.body, {"any-key": "any-value"});
    });
    test("should return 500 if client throws", () async {
      client.mockPostThrows();

      var response = await sut.post(url: path);

      expect(response.statuscode, 500);
    });
    test("should call client with defaults headers", () async {
      await sut.post(url: path);

      verify(() => client.post(
              Uri.parse(
                url + path,
              ),
              body: jsonEncode(null),
              headers: {
                'content-type': 'application/json',
                'accept': 'application/json'
              })).called(1);
    });
    test("should call client with right headers", () async {
      await sut.post(url: path, headers: {
        'content-type': 'application/json',
        'accept': 'application/xml',
      });

      verify(
        () => client.post(
          Uri.parse(url + path),
          body: jsonEncode(null),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/xml',
          },
        ),
      ).called(1);
    });
    test("should call post with json encode", () async {
      await sut.post(url: path);

      verify(
        () => client.post(
          Uri.parse(url + path),
          body: jsonEncode(null),
          headers: {
            'content-type': 'application/json',
            'accept': 'application/json'
          },
        ),
      );
    });
    test("should return empty object body if empty string", () async {
      client.mockPost(http.Response("", 200));
      final response = await sut.post(url: path);

      print(response.body);
      expect(response.body, jsonDecode("{}"));
    });

    test("should return correct body", () async {
      client.mockPost(http.Response("{\"username\":\"any-data\"}", 200));
      final response = await sut.post(url: path);

      print(response.body);
      expect(response.body, jsonDecode("{\"username\":\"any-data\"}"));
    });
  });
}
