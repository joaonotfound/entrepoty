import 'package:entrepoty/ui/screens/signup/components/components.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
