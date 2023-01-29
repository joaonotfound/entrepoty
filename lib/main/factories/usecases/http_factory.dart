import 'package:mocktail/mocktail.dart';

import '../../../data/data.dart';

//todo: implements httpclient
class MockHttpClient extends Mock implements HttpClient {}

HttpClient makeHttpAdapter() {
  var mockHttpClient = MockHttpClient();
  when(() =>
          mockHttpClient.post(url: any(named: "url"), body: any(named: "body")))
      .thenAnswer(
    (_) async {
      await Future.delayed(const Duration(seconds: 2), () {});
      throw HttpError.serverError;
    },
  );
  return mockHttpClient;
}
