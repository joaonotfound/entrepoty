import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/data.dart';

class MockHttpClient extends Mock implements HttpClient {
  // ignore: unnecessary_this
  When _mockGetCall() => when(() => this.get(url: any(named: "url")));
  void mockGet(HttpResponse response) =>
      // ignore: prefer_const_constructors
      _mockGetCall().thenAnswer((_) async => response);
  void mockGetError(HttpError error) => _mockGetCall().thenThrow(error);
}
