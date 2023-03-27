import 'package:entrepoty/data/cache/cache.dart';

import '../../presentation/protocols/theme.dart';

class LocalTheme implements Theme {
  SecureCacheStorage storage;
  LocalTheme({
    required this.storage,
  });

  loadIsDark() {
    throw UnimplementedError();
  }

  @override
  setIsDark() {
    throw UnimplementedError();
  }
}
