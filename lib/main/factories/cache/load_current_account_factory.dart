import 'package:service_desk_2/data/usecases/usecases.dart';
import 'package:service_desk_2/main/factories/factories.dart';

LocalLoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(
      loadSecureCacheStorage: makeLocalCacheStorageAdapter());
}
