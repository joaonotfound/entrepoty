import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';

RemoteSaveCustomer makeRemoteSaveCustomer() {
  return RemoteSaveCustomer(
    client: makeHttpAdapter(),
    url: BackendUrls.createCustomer,
  );
}
