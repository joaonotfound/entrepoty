import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget
    {
  final LoginPresenter presenter;

  const LoginScreen({
    required this.presenter, super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoadingManager, NavigationManager, UiErrorManager {
  @override
  void initState() {
    handleLoading(context, widget.presenter.isLoadingStream);
    handleNavigation(context, widget.presenter.navigateToStream);
    handleUiError(context, widget.presenter.mainErrorStream);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.settingsBackend),
            icon: const Icon(
              FluentIcons.settings_20_regular,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      // appBar: makeLoginAppbarComponent(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: Column(children: [
            const Expanded(
              flex: 40,
              child: LoginCircularAccount(),
            ),
            Expanded(
              flex: 60,
              child: Form(
                child: ListenableProvider(
                  create: (_) => widget.presenter,
                  child: ListView(
                    children: const [
                      LoginUsernameField(),
                      UserPasswordField(),
                      LoginSubmitButton(),
                      LoginSignupRedirect(),
                    ],
                  ),
                ),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
