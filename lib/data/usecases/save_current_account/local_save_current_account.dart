import 'package:service_desk_2/data/data.dart';
import 'package:service_desk_2/domain/domain.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccountUsecase {
  final SaveSecureCacheStorage saveSecureCacheStorage;
  LocalSaveCurrentAccount({
    required this.saveSecureCacheStorage,
  });
  @override
  Future<void> saveAccount({required Account account}) async {
    saveSecureCacheStorage.saveSecure(key: "token", value: account.token);
  }
}
