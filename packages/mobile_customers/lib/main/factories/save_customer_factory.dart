import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../data/data.dart';

RemoteSaveCustomer makeRemoteSaveCustomer() {
  return RemoteSaveCustomer(
    client: makeFunctionalHttpAdapter(),
    url: BackendUrls.customers,
  );
}
