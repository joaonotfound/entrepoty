import 'package:mobile_core/mobile_core.dart';


class LocalThemeLoader implements ThemeLoader {
  SecureCacheStorage storage;
  LocalThemeLoader({
    required this.storage,
  });

  @override
  loadIsDark() async {
    var local = await storage.loadSecure(key: "is-dark");
    return local == "false" ? false : true;
  }

  @override
  setIsDark(bool value) async {
    await storage.saveSecure(key: "is-dark", value: value.toString());
    return;
  }
}
