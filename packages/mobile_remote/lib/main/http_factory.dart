import 'package:http/http.dart';
import 'package:mobile_core/main/main.dart';
import 'package:mobile_settings/main/factories/factories.dart';

import '../data/data.dart';

HttpAdapter makeHttpAdapter() {
  return HttpAdapter(
    client: Client(),
    currentAccount: makeLocalLoadCurrentAccount(),
    loadBackendSettings: makeLocalLoadCurrentBackendSettings(),
  );
}
