import 'package:fpdart/fpdart.dart';
import 'package:mobile_remote/mobile_remote.dart';
import 'package:mocktail/mocktail.dart';

class MockFunctionalHttpClient extends Mock implements FunctionalHttpClientUsecase {
  // ignore: unnecessary_this
  When _mockGetCall() => when(
          () => get(url: any(named: 'url'), timeout: any(named: 'timeout')),);
  void mockGet(Either<HttpErrorEnum, HttpResponse> response) =>
      // ignore: prefer_const_constructors
  _mockGetCall().thenAnswer((_) async => response);
  void mockGetError(HttpError error) => _mockGetCall().thenThrow(error);

  When _mockPostCall() =>
      // ignore: unnecessary_this
  when(() => this.post(
      url: any(named: 'url'),
      body: any(named: 'body'),
      timeout: any(named: 'timeout'),),);
  void mockPost(Either<HttpErrorEnum, HttpResponse> response) =>
      // ignore: prefer_const_constructors
  _mockPostCall().thenAnswer((_) async => response);
  void mockPostError(HttpErrorEnum error) => mockPost(error.toLeft());
}
