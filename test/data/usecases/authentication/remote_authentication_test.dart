import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/data.dart';

import '../../mocks/http_client.dart';

void main() {
  late RemoteAuthentication sut;
  final String url = faker.internet.httpUrl();
  late MockHttpClient httpClient;
  String id = faker.guid.guid();
  String password = faker.internet.password();
  setUp(() {
    httpClient = MockHttpClient();
    httpClient.mockPost(HttpResponse(statuscode: 200, body: {
      "account": {
        "id": faker.guid.guid(),
        "name": faker.internet.userName(),
        "profile_url": faker.internet.httpUrl(),
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
}
