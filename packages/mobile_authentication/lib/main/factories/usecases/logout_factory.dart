import 'package:mobile_core/mobile_core.dart';

import '../../../data/data.dart';

LocalLogout makeLocalLogout() {
  return LocalLogout(storage: makeLocalCacheStorageAdapter());
}
