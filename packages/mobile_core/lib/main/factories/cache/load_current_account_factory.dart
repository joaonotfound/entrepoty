

import '../../../data/data.dart';
import 'cache.dart';

LocalLoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(
      loadSecureCacheStorage: makeLocalCacheStorageAdapter());
}
