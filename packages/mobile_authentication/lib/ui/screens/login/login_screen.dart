import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'login_presenter.dart';

class LoginScreen extends StatelessWidget
    with LoadingManager, NavigationManager, UiErrorManager {
  final LoginPresenter presenter;
  const LoginScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: makeLoginAppbarComponent(),
      body: SafeArea(
        child: Builder(builder: (context) {
          handleLoading(context, presenter.isLoadingStream);
          handleNavigation(context, presenter.navigateToStream);
          handleUiError(context, presenter.mainErrorStream);

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            child: Column(children: [
              Expanded(
                flex: 40,
                child: LoginCircularAccount(),
              ),
              Expanded(
                flex: 60,
                child: Form(
                  child: ListenableProvider(
                    create: (_) => presenter,
                    child: ListView(
                      children: [
                        LoginUsernameField(),
                        UserPasswordField(),
                        LoginSubmitButton(),
                        LoginSignupRedirect(),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }
}
