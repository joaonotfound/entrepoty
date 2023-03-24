import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccountUsecase {
  final SaveSecureCacheStorage saveSecureCacheStorage;
  LocalSaveCurrentAccount({
    required this.saveSecureCacheStorage,
  });
  @override
  Future<void> saveAccount({required Account account}) async {
    try {
      saveSecureCacheStorage.saveSecure(key: "token", value: account.token);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
