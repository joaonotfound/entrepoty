import 'package:entrepoty/data/data.dart';
import 'package:mobile_core/mobile_core.dart';

LocalLogout makeLocalLogout() {
  return LocalLogout(storage: makeLocalCacheStorageAdapter());
}
