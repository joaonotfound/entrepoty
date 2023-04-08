import 'package:mobile_core/main/factories/cache/cache.dart';
import 'package:mobile_settings/data/data.dart';

LocalLoadCurrentBackendSettings makeLocalLoadCurrentBackendSettings() {
  return LocalLoadCurrentBackendSettings(
    loadSecureCacheStorage: makeLocalCacheStorageAdapter(),
  );
}
