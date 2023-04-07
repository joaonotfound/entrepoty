import '../../../data/data.dart';
import '../../../domain/domain.dart';
import '../cache/cache.dart';

SaveCurrentAccountUsecase makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeLocalCacheStorageAdapter());
}
