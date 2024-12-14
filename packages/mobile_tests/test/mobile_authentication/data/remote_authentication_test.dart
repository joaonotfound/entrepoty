import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';
import 'package:mocktail/mocktail.dart';

import '../../mobile_remote/mobile_remote.dart';

void main() {
  late RemoteLogin sut;
  final String url = faker.internet.httpUrl();
  late MockFunctionalHttpClient httpClient;
  final String username = faker.internet.userName();
  final String password = faker.internet.password();

  void mockPost() => httpClient.mockPost(
        HttpResponse(
          statuscode: 200,
          body: {
            'token': faker.guid.guid(),
            'username': faker.internet.userName(),
            'name': faker.internet.userName(),
            'profile_url': faker.internet.httpUrl(),
          },
        ).toRight(),
      );

  setUp(() {
    httpClient = MockFunctionalHttpClient();
    mockPost();
    sut = RemoteLogin(url: url, httpClient: httpClient);
  });
  group('RemoteAuthentication', () {
    test('Should call httpclient with correct values', () async {
      await sut.authenticate(username: username, password: password);
      verify(() => httpClient.post(
          url: url,
          body: {
            'username': username,
            'password': password,
          },
          timeout: const Duration(seconds: 2),),).called(1);
    });
    test('Should return domain error if httpclient returns http error',
        () async {
      const error = HttpErrorEnum.badRequest;
      httpClient.mockPostError(error);
      final response = await sut.authenticate(username: username, password: password);
      expect(response, error.asDomainError.toLeft());
    });
    test('Should return account on success', () async {
      final response =
          await sut.authenticate(username: username, password: password);
      expect(response, isInstanceOf<Either<dynamic, Account>>());
    });
  });
}
