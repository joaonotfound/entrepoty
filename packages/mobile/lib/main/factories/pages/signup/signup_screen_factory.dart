import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';

SignupScreen makeSignupScreen() {
  return SignupScreen(
    presenter: GetxSignupPresenter(
      validation: makeSignupValidationComposite(),
      usecase: LocalSignup(),
      saveAccount: makeLocalSaveCurrentAccount(),
    ),
  );
}
