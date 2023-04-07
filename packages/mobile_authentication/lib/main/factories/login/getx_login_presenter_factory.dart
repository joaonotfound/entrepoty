import 'package:mobile_core/main/main.dart';

import '../../../../presentation/presentation.dart';
import '../../../../ui/ui.dart';
import '../../main.dart';

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
    saveCurrentAccount: makeLocalSaveCurrentAccount(),
    validator: makeLoginValidationComposite(),
    authentication: makeRemoteAuthentication(),
  );
}
