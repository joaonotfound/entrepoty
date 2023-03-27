import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class ClientMock extends Mock implements Client {
  When mockPostCall() => when(() => post(any(named: "url")));
  void mockPost(response) => mockPostCall().thenAnswer((_) => response);

  When mockGetCall() => when(() => get(any(named: "url")));
  void mockGet(response) => mockGetCall().thenAnswer((_) => response);
}
