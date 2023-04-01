import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../ui/ui.dart';

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
          handleLoginManager(context, presenter.isLoadingStream);
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
                child: ListView(
                  children: [
                    ListenableProvider(
                      create: (_) => presenter,
                      child: Form(
                        child: Column(
                          children: const [
                            LoginUsernameField(),
                            UserPasswordField(),
                            LoginSubmitButton()
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }
}
