import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/data.dart';
import 'package:service_desk_2/domain/domain.dart';

import '../../mocks/http_client.dart';

void main() {
  late RemoteAuthentication sut;
  final String url = faker.internet.httpUrl();
  late MockHttpClient httpClient;
  String id = faker.guid.guid();
  String password = faker.internet.password();
  Account validAccount = Account(
      id: faker.guid.guid(),
      name: faker.internet.userName(),
      profilePictureUrl: faker.internet.httpUrl());
  setUp(() {
    httpClient = MockHttpClient();
    httpClient.mockPost(HttpResponse(statuscode: 200, body: {
      "account": {
        "id": validAccount.id,
        "name": validAccount.name,
        "profile_url": validAccount.profilePictureUrl,
      }
    }));
    sut = RemoteAuthentication(url: url, httpClient: httpClient);
  });
  test("Should call httpclient with correct values", () async {
    await sut.authenticate(id: id, password: password);
    verify(() => httpClient.post(url: url, body: {
          "id": id,
          "password": password,
        })).called(1);
  });
  test("Should throw invalidCredentials if httpclient throws badrequest",
      () async {
    httpClient.mockPostError(HttpError.badRequest);
    var future = sut.authenticate(id: id, password: password);
    expect(future, throwsA(DomainError.invalidCredentials));
  });
  test("Should throw invalidCredentials if httpclient throws", () async {
    httpClient.mockPostError(HttpError.badRequest);
    var future = sut.authenticate(id: id, password: password);
    expect(future, throwsA(DomainError.invalidCredentials));
  });
  test("Should throw unexpected if httpclient throws", () async {
    httpClient.mockPostError(HttpError.unexpected);
    var future = sut.authenticate(id: id, password: password);
    expect(future, throwsA(DomainError.unexpected));
  });
  test("Should return account on success", () async {
    var response = await sut.authenticate(id: id, password: password);
    expect(response, isInstanceOf<Account>());
  });
}
