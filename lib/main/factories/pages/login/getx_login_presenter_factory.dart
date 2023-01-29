import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/ui/ui.dart';

LoginPresenter makeGetxLoginPresenter() {
  return GetxLoginPresenter(
      validator: makeLoginValidationComposite(),
      authentication: makeRemoteAuthentication());
}
