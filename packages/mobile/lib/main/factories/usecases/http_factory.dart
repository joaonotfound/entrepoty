import 'package:entrepoty/infra/http/http.dart';
import 'package:entrepoty/main/main.dart';
import 'package:http/http.dart';

import '../../../data/data.dart';

HttpClient makeHttpAdapter() {
  return HttpAdapter(
    client: Client(),
    currentAccount: makeLocalLoadCurrentAccount(),
  );
}
