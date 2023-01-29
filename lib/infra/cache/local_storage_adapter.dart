import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:service_desk_2/data/data.dart';

class LocalStorageAdapter implements SaveSecureCacheStorage {
  final FlutterSecureStorage secureStorage;

  LocalStorageAdapter({
    required this.secureStorage,
  });

  @override
  Future<void> saveSecure({required String key, required String value}) async {
    secureStorage.write(key: key, value: value);
  }
}
