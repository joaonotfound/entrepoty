import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SignupPasswordField extends StatefulWidget {
  const SignupPasswordField({super.key});

  @override
  State<SignupPasswordField> createState() => _SignupPasswordFieldState();
}

class _SignupPasswordFieldState extends State<SignupPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.lock_closed_12_regular),
        hintText: "Your most secure password",
        label: Text("Password"),
      ),
    );
  }
}
