import '../../../main.dart';
import '../../../../presentation/presentation.dart';
import '../../../../ui/ui.dart';

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      saveCurrentAccount: makeLocalSaveCurrentAccount(),
      validator: makeLoginValidationComposite(),
      authentication: makeLocalAuthentication());
}
