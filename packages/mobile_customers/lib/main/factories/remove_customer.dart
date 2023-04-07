import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/main/main.dart';

import '../../data/data.dart';

RemoteRemoveCustomer makeRemoteRemoveCustomer(){
  return RemoteRemoveCustomer(
    client: makeHttpAdapter(),
    url: BackendUrls.customers,
  );
}
