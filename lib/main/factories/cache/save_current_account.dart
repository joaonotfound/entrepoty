import 'package:service_desk_2/data/usecases/usecases.dart';
import 'package:service_desk_2/domain/usecases/usecases.dart';
import 'package:service_desk_2/main/factories/factories.dart';

SaveCurrentAccountUsecase makeLocalSaveCurrentAccount() {
  return LocalSaveCurrentAccount(
      saveSecureCacheStorage: makeLocalCacheStorageAdapter());
}
