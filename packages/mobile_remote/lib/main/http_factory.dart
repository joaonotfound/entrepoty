import 'package:http/http.dart';
import 'package:mobile_core/main/main.dart';

import '../data/data.dart';
import '../domain/domain.dart';

HttpClient makeHttpAdapter() {
  return HttpAdapter(
    client: Client(),
    currentAccount: makeLocalLoadCurrentAccount(),
  );
}
