import '../../../../main/main.dart';
import '../../../../presentation/presentation.dart';
import '../../../../ui/ui.dart';

LoginPresenter makeStreamLoginPresenter() {
  return StreamLoginPresenter(
      validator: makeLoginValidationComposite(),
      authentication: makeRemoteAuthentication());
}
