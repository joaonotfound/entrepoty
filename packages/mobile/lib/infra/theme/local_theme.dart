import 'package:entrepoty/data/cache/cache.dart';

import '../../presentation/protocols/theme_loader.dart';

class LocalThemeLoader implements ThemeLoader {
  SecureCacheStorage storage;
  LocalThemeLoader({
    required this.storage,
  });

  loadIsDark() async {
    var local = await storage.loadSecure(key: "is-dark");
    return local == "true" ? true : false;
  }

  setIsDark(bool value) async {
    await storage.saveSecure(key: "is-dark", value: value.toString());
    return;
  }
}
