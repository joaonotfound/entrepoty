import 'package:entrepoty/data/usecases/usecases.dart';
import 'package:entrepoty/main/factories/factories.dart';

LocalLoadCurrentAccount makeLocalLoadCurrentAccount() {
  return LocalLoadCurrentAccount(
      loadSecureCacheStorage: makeLocalCacheStorageAdapter());
}
