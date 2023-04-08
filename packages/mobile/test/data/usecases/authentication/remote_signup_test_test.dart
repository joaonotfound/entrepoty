import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/data/usecases/authentication/remote_signup.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../data.dart';

void main() {
  late RemoteSignup sut;
  late MockHttpClient http;
  final url = "/api/v1/auth/signup";
  setUp(() {
    http = MockHttpClient();
    http.mockPost(HttpResponse(statuscode: 200));
    sut = RemoteSignup(http: http, url: url);
  });
  group("RemoteSignup", () {
    test("should call http with correct values", () async {
      sut.register(
        name: "any-name",
        username: "any-username",
        password: "any-password",
      );

      verify(
        () => http.post(
          url: url,
          body: {
            "name": "any-name",
            "username": "any-username",
            "password": "any-password"
          },
          timeout: Duration(seconds: 2),
        ),
      ).called(1);
    });
    test("should return account with correct values", () async {
      final response = HttpResponse(statuscode: 200, body: {
        "accessToken": "random-token",
        "username": "random-username",
        "name": "random-name",
        "profile_url": "random_profile_url",
      });
      http.mockPost(response);

      final registerResponse = await sut.register(
        name: "random-name",
        username: "random-username",
        password: "random-password",
      );
      final account = registerResponse.getLeft().toNullable();
      expect(account?.username, "random-username");
      expect(account?.token, "random-token");
    });
    test("should return unexpected if client throws", () async {
      http.mockPostError(HttpError.serverError);

      final response = await sut.register(name: "", username: "", password: "");

      expect(response, Right(DomainError.unexpected));
    });
    test("should return invalid credentials on bad request", () async {
      http.mockPostError(HttpError.badRequest);

      final response = await sut.register(name: "", username: "", password: "");

      expect(response, Right(DomainError.unauthorized));
    });
    test("should return unexpected if http returns other statuscode than 200",
        () async {
      http.mockPost(HttpResponse(statuscode: 500));

      final response = await sut.register(name: "", username: "", password: "");

      expect(response, Right(DomainError.unexpected));
    });
  });
}
