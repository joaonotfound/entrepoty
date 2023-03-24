import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:entrepoty/infra/infra.dart';

LocalStorageAdapter makeLocalCacheStorageAdapter() {
  return LocalStorageAdapter(secureStorage: FlutterSecureStorage());
}
