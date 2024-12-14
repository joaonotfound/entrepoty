import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'signup_presenter.dart';

class SignupScreen extends StatefulWidget
    {
  final SignupPresenter presenter;

  const SignupScreen({
    required this.presenter, super.key,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with LoadingManager, NavigationManager, UiErrorManager {
  @override
  void initState() {
    handleLoading(context, widget.presenter.isLoadingStream);
    handleNavigation(context, widget.presenter.navigateToStream);
    handleUiError(context,  widget.presenter.mainErrorStream);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Get.toNamed(Routes.settingsBackend),
              icon: const Icon(
                FluentIcons.settings_20_regular,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: ListenableProvider(
            create: (_) => widget.presenter,
            child: Form(
              child: ListView(children: const [
                SignupWelcomeMessage(),
                SignupNameField(),
                SignupUsernameField(),
                SignupPasswordField(),
                SignupSubmit(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('By signing up, you agree to the '),
                    Text(
                      'Terms of Use.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],),
            ),
          ),
        ),);
  }
}
