import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements http.Client {
  When mockGetCall() => when(() => get(any(), headers: any(named: 'headers')));
  void mockGet(http.Response response) =>
      mockGetCall().thenAnswer((invocation) async => response);
  void mockGetThrows() => mockGetCall().thenThrow(Error());

  When mockPostCall() => when(() =>
      post(any(), body: any(named: 'body'), headers: any(named: 'headers')),);
  void mockPost(http.Response response) =>
      mockPostCall().thenAnswer((invocation) async => response);
  void mockPostThrows() => mockPostCall().thenThrow(Error());
}
