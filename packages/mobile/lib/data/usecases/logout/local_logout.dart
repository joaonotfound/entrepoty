import 'package:entrepoty/data/cache/cache.dart';
import 'package:entrepoty/domain/domain.dart';

class LocalLogout implements LogoutUsecase {
  SaveSecureCacheStorage storage;
  LocalLogout({
    required this.storage,
  });

  Future<void> logout() async {
    await storage.saveSecure(key: "token", value: "");
  }
}
