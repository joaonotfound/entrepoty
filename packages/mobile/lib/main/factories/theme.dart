import 'package:entrepoty/infra/infra.dart';
import 'package:mobile_core/mobile_core.dart';

LocalThemeLoader makeLocalTheme() {
  return LocalThemeLoader(storage: makeLocalCacheStorageAdapter());
}
