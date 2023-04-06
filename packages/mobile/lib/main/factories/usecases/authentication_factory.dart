import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../../main.dart';

LoginUsecase makeLocalAuthentication() {
  return LocalLogin();
}

LoginUsecase makeRemoteAuthentication() {
  return RemoteLogin(
    url: BackendUrls.login,
    httpClient: makeHttpAdapter(),
  );
}
