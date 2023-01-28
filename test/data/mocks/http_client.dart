import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/data/data.dart';

class MockHttpClient extends Mock implements HttpClient {
  // ignore: unnecessary_this
  When _mockGetCall() => when(() => this.get(url: any(named: "url")));
  void mockGet(HttpResponse response) =>
      // ignore: prefer_const_constructors
      _mockGetCall().thenAnswer((_) async => response);
  void mockGetError(HttpError error) => _mockGetCall().thenThrow(error);

  When _mockPostCall() =>
      // ignore: unnecessary_this
      when(() => this.post(url: any(named: "url"), body: any(named: "body")));
  void mockPost(HttpResponse response) =>
      // ignore: prefer_const_constructors
      _mockPostCall().thenAnswer((_) async => response);
  void mockPostError(HttpError error) => _mockGetCall().thenThrow(error);
}
