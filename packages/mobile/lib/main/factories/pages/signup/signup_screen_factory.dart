import 'package:entrepoty/data/usecases/authentication/remote_signup.dart';
import 'package:entrepoty/main/main.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';

SignupScreen makeSignupScreen() {
  return SignupScreen(
    presenter: GetxSignupPresenter(
      validation: makeSignupValidationComposite(),
      usecase: RemoteSignup(
        http: makeHttpAdapter(),
        url: "/api/v1/auth/signup",
      ),
      saveAccount: makeLocalSaveCurrentAccount(),
    ),
  );
}
