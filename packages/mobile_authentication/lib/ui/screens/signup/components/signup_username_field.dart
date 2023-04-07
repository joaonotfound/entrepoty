import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../signup_presenter.dart';

class SignupUsernameField extends StatefulWidget {
  const SignupUsernameField({super.key});

  @override
  State<SignupUsernameField> createState() => _SignupUsernameFieldState();
}

class _SignupUsernameFieldState extends State<SignupUsernameField> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupPresenter>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: StreamBuilder<String?>(
        stream: provider.usernameErrorStream,
        builder: (context, snapshot) => TextFormField(
          onChanged: provider.validateUsername,
          decoration: InputDecoration(
            prefixIcon: Icon(FluentIcons.person_accounts_20_regular),
            hintText: "Username",
            errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
            label: Text("Username"),
          ),
        ),
      ),
    );
  }
}
