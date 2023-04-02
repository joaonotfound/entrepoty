import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/data/usecases/authentication/remote_signup.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../data.dart';

void main() {
  late RemoteSignup sut;
  late MockHttpClient http;
  setUp(() {
    http = MockHttpClient();
    http.mockPost(HttpResponse(statuscode: 200));
    sut = RemoteSignup(http: http);
  });
  group("RemoteSignup", () {
    test("should call http with correct values", () async {
      sut.register(
        name: "any-name",
        username: "any-username",
        password: "any-password",
      );

      verify(() => http.post(url: "/api/v1/signup", body: {
            "name": "any-name",
            "username": "any-username",
            "password": "any-password"
          })).called(1);
    });
  });
}
