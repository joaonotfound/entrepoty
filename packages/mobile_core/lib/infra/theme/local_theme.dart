import 'package:mobile_core/mobile_core.dart';


class LocalThemeLoader implements ThemeLoader {
  SecureCacheStorage storage;
  LocalThemeLoader({
    required this.storage,
  });

  @override
  Future<bool> loadIsDark() async {
    final local = await storage.loadSecure(key: 'is-dark');
    return local == 'false' ? false : true;
  }

  @override
  Future<void> setIsDark(bool value) async {
    await storage.saveSecure(key: 'is-dark', value: value.toString());
    return;
  }
}
