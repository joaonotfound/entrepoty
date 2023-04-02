import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPasswordField extends StatefulWidget {
  const SignupPasswordField({super.key});

  @override
  State<SignupPasswordField> createState() => _SignupPasswordFieldState();
}

class _SignupPasswordFieldState extends State<SignupPasswordField> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignupPresenter>(context);
    return StreamBuilder<String?>(
      stream: presenter.passwordErrorStream,
      builder: (context, snapshot) => TextFormField(
        onChanged: presenter.validatePassword,
        obscureText: true,
        decoration: InputDecoration(
          prefixIcon: Icon(FluentIcons.lock_closed_12_regular),
          errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
          hintText: "Your most secure password",
          label: Text("Password"),
        ),
      ),
    );
  }
}
