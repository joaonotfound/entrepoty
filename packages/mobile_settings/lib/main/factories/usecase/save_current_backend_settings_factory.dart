import 'package:mobile_core/main/factories/cache/cache.dart';
import 'package:mobile_settings/data/data.dart';

LocalSaveCurrentBackendSettings makeLocalSaveCurrentBackendSettings() {
  return LocalSaveCurrentBackendSettings(
    saveSecureCacheStorage: makeLocalCacheStorageAdapter(),
  );
}
