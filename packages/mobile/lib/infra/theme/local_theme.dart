import 'package:entrepoty/data/cache/cache.dart';

import '../../presentation/protocols/theme.dart';

class LocalTheme implements Theme {
  SecureCacheStorage storage;
  LocalTheme({
    required this.storage,
  });

  loadIsDark() async {
    var local = await storage.loadSecure(key: "is-dark");
    return local == "true" ? true : false;
  }

  setIsDark(bool value) async {
    return;
  }
}
