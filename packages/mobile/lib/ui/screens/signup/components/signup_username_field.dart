import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SignupUsernameField extends StatefulWidget {
  const SignupUsernameField({super.key});

  @override
  State<SignupUsernameField> createState() => _SignupUsernameFieldState();
}

class _SignupUsernameFieldState extends State<SignupUsernameField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(FluentIcons.person_accounts_20_regular),
          hintText: "Username",
          label: Text("Username"),
        ),
      ),
    );
  }
}
