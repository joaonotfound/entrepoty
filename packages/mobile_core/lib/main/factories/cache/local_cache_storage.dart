import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../data/data.dart';

LocalStorageAdapter makeLocalCacheStorageAdapter() {
  return LocalStorageAdapter(secureStorage: const FlutterSecureStorage());
}
