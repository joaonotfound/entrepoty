import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'signup_presenter.dart';

class SignupScreen extends StatelessWidget
    with LoadingManager, NavigationManager, UiErrorManager {
  final SignupPresenter presenter;

  SignupScreen({
    super.key,
    required this.presenter,
  });

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
        body: Builder(
          builder: (context) {
            handleLoading(context, presenter.isLoadingStream);
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
                    SignupSubmit(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By signing up, you agree to the "),
                        Text(
                          "Terms of Use.",
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            );
          },
        ));
  }
}
