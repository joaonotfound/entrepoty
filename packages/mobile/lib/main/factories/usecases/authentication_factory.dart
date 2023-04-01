import 'package:faker/faker.dart';

import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../main.dart';

LoginUsecase makeLocalAuthentication() {
  return LocalLogin();
}

LoginUsecase makeRemoteAuthentication() {
  return RemoteLogin(
      url: faker.internet.httpUrl(), httpClient: makeHttpAdapter());
}
