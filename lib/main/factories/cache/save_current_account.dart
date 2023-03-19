import 'package:entrepoty/data/usecases/usecases.dart';
import 'package:entrepoty/domain/usecases/usecases.dart';
import 'package:entrepoty/main/factories/factories.dart';

SaveCurrentAccountUsecase makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeLocalCacheStorageAdapter());
}
