import 'package:mocktail/mocktail.dart';

import '../../../data/data.dart';

class MockHttpClient extends Mock implements HttpClient {}

HttpClient makeHttpAdapter() {
  return MockHttpClient();
}
