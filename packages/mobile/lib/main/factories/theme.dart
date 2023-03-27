import 'package:entrepoty/infra/infra.dart';
import 'package:entrepoty/main/factories/cache/cache.dart';

LocalThemeLoader makeLocalTheme() {
  return LocalThemeLoader(storage: makeLocalCacheStorageAdapter());
}
