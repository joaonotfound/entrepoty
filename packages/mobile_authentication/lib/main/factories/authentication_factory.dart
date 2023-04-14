import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';

LoginUsecase makeLocalAuthentication() {
  return LocalLogin();
}

LoginUsecase makeRemoteAuthentication() {
  return RemoteLogin(
    url: BackendUrls.login,
    httpClient: makeFunctionalHttpAdapter(),
  );
}
