import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/factories/cache/cache.dart';

LocalLogout makeLocalLogout() {
  return LocalLogout(storage: makeLocalCacheStorageAdapter());
}
