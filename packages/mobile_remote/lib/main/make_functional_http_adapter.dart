import 'package:http/http.dart';
import 'package:mobile_core/main/factories/cache/cache.dart';
import 'package:mobile_remote/data/data.dart';
import 'package:mobile_settings/main/factories/factories.dart';

FunctionalHttpAdapter makeFunctionalHttpAdapter() {
  return FunctionalHttpAdapter(
    client: Client(),
    currentAccount: makeLocalLoadCurrentAccount(),
    loadBackendSettings: makeLocalLoadCurrentBackendSettings(),
  );
}
