import 'package:entrepoty/infra/infra.dart';
import 'package:entrepoty/main/factories/cache/cache.dart';

LocalTheme makeLocalTheme() {
  return LocalTheme(storage: makeLocalCacheStorageAdapter());
}
