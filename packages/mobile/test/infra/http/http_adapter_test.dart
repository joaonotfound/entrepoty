import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class HttpAdapter {
  http.Client client;
  HttpAdapter({
    required this.client,
  });

  Future<void> get({required String url}) async {
    await client.get(Uri.parse(url));
  }
}

class ClientMock extends Mock implements http.Client {
  When mockGetCall() => when(() => get(any()));
  void mockGet(http.Response response) =>
      mockGetCall().thenAnswer((invocation) async => response);
}

void main() {
  late HttpAdapter sut;
  late ClientMock client;
  var url = faker.internet.httpUrl();
  setUpAll(() {
    registerFallbackValue(Uri.parse(url));
  });
  setUp(() {
    client = ClientMock();
    client.mockGet(http.Response("{}", 200));
    sut = HttpAdapter(client: client);
  });

  group("HttpAdapter get", () {
    test("should call client with correct url", () async {
      await sut.get(url: url);

      verify(() => client.get(Uri.parse(url))).called(1);
    });
  });
}
