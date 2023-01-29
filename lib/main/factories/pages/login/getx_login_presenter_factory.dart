import '../../../main.dart';
import '../../../../presentation/presentation.dart';
import '../../../../ui/ui.dart';

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      validator: makeLoginValidationComposite(),
      authentication: makeRemoteAuthentication());
}
