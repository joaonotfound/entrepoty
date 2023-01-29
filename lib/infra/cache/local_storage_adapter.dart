import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:service_desk_2/data/data.dart';
import 'package:service_desk_2/domain/domain.dart';

class LocalStorageAdapter
    implements SaveSecureCacheStorage, LoadSecureCacheStorage {
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
      secureStorage.read(key: key);
    } catch (_) {
      throw DomainError.unexpected;
    }
  }
}
