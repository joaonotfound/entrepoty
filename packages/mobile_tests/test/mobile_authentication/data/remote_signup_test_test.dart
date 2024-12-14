import 'package:fpdart/fpdart.dart';
import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mobile_remote/mobile_remote.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../mobile_remote/mobile_remote.dart';

void main() {
  late RemoteSignup sut;
  late MockFunctionalHttpClient http;
  const url = '/api/v1/auth/signup';
  setUp(() {
    http = MockFunctionalHttpClient();
    http.mockPost(const HttpResponse(statuscode: 200, body: {}).toRight());
    sut = RemoteSignup(http: http, url: url);
  });
  group('RemoteSignup', () {
    test('should call http with correct values', () async {
      await sut.register(
        name: 'any-name',
        username: 'any-username',
        password: 'any-password',
      );

      verify(
        () => http.post(
          url: url,
          body: {
            'name': 'any-name',
            'username': 'any-username',
            'password': 'any-password',
          },
          timeout: const Duration(seconds: 2),
        ),
      ).called(1);
    });
    test('should return account with correct values', () async {
      const response = HttpResponse(
        statuscode: 200,
        body: {
          'accessToken': 'random-token',
          'username': 'random-username',
          'name': 'random-name',
          'profile_url': 'random_profile_url',
        },
      );
      http.mockPost(response.toRight());

      final registerResponse = await sut.register(
        name: 'random-name',
        username: 'random-username',
        password: 'random-password',
      );
      final account = registerResponse.getLeft().toNullable();
      expect(account?.username, 'random-username');
      expect(account?.token, 'random-token');
    });
    test('should return domain error on http errors', () async {
      const error = HttpErrorEnum.serverError;
      http.mockPostError(error);

      final response = await sut.register(name: '', username: '', password: '');

      expect(response, Either.right(error.asDomainError));
    });
  });
}
