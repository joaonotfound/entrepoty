

import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../data/data.dart';
import '../../../presentation/presentation.dart';
import '../../../ui/screens/screens.dart';
import '../../main.dart';

SignupScreen makeSignupScreen() {
  return SignupScreen(
    presenter: GetxSignupPresenter(
      validation: makeSignupValidationComposite(),
      usecase: RemoteSignup(
        http: makeFunctionalHttpAdapter(),
        url: BackendUrls.signup,
      ),
      saveAccount: makeLocalSaveCurrentAccount(),
    ),
  );
}
