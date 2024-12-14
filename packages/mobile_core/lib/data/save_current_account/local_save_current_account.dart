import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

class LocalSaveCurrentAccount implements SaveCurrentAccountUsecase {
  final SaveSecureCacheStorage saveSecureCacheStorage;
  LocalSaveCurrentAccount({
    required this.saveSecureCacheStorage,
  });
  @override
  Future<Either<DomainError, dynamic>> saveAccount({required Account account}) async {
    try {
      saveSecureCacheStorage.saveSecure(key: 'token', value: account.token);
      return Either.right(null);
    } catch (_) {
      return DomainError.unexpected.toLeft();
    }
  }
}
