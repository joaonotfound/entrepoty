import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/ui/ui.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(
      validator: makeLoginValidationComposite(),
      authentication: makeRemoteAuthentication());
}
