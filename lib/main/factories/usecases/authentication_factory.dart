import 'package:faker/faker.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../main.dart';

AuthenticationUsecase makeLocalAuthentication() {
  return LocalAuthentication();
}

AuthenticationUsecase makeRemoteAuthentication() {
  return RemoteAuthentication(
      url: faker.internet.httpUrl(), httpClient: makeHttpAdapter());
}
