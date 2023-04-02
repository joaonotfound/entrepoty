import 'package:entrepoty/ui/screens/signup/components/components.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
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
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Form(
                child: ListView(children: [
                  SignupWelcomeMessage(),
                  SignupNameField(),
                  SignupUsernameField(),
                  SignupPasswordField(),
                  SignupSubmit()
                ]),
              ),
            );
          },
        ));
  }
}
