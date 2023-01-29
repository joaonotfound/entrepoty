import 'package:service_desk_2/data/usecases/usecases.dart';
import 'package:service_desk_2/domain/domain.dart';
import 'package:service_desk_2/main/factories/factories.dart';

import 'package:faker/faker.dart';

AuthenticationUsecase makeRemoteAuthentication() {
  return RemoteAuthentication(
      url: faker.internet.httpUrl(), httpClient: makeHttpAdapter());
}
