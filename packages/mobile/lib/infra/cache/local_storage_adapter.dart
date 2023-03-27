import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/domain/domain.dart';

class LocalStorageAdapter
    implements
        SaveSecureCacheStorage,
        LoadSecureCacheStorage,
        SecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({
    required this.secureStorage,
  });

  @override
  Future<void> saveSecure({required String key, required String value}) async {
    try {
      secureStorage.write(key: key, value: value);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }

  @override
  Future<String?> loadSecure({required String key}) async {
    try {
      return await secureStorage.read(key: key);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
