import 'package:entrepoty/ui/screens/signup/components/components.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget with LoadingManager, NavigationManager, UiErrorManager  {
  SignupPresenter presenter;

  SignupScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Builder(
          builder: (context) {
            handleLoginManager(context, presenter.isLoadingStream);
            handleNavigation(context, presenter.navigateToStream);
            handleUiError(context, presenter.mainErrorStream);

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: ListenableProvider(
                create: (_) => presenter,
                child: Form(
                  child: ListView(children: [
                    SignupWelcomeMessage(),
                    SignupNameField(),
                    SignupUsernameField(),
                    SignupPasswordField(),
                    SignupSubmit()
                  ]),
                ),
              ),
            );
          },
        ));
  }
}
