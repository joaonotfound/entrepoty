import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:service_desk_2/infra/infra.dart';

LocalStorageAdapter makeLocalCacheStorageAdapter() {
  return LocalStorageAdapter(secureStorage: FlutterSecureStorage());
}
