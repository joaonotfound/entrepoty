import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';

class LocalLogout implements LogoutUsecase {
  SaveSecureCacheStorage storage;
  LocalLogout({
    required this.storage,
  });

  @override
  Future<void> logout() async {
    await storage.saveSecure(key: "token", value: "");
  }
}
