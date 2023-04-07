import 'package:entrepoty/domain/domain.dart';
import 'package:mobile_core/mobile_core.dart';

class LocalLogout implements LogoutUsecase {
  SaveSecureCacheStorage storage;
  LocalLogout({
    required this.storage,
  });

  Future<void> logout() async {
    await storage.saveSecure(key: "token", value: "");
  }
}
