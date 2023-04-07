import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class LoginUsernameField extends StatelessWidget {
  const LoginUsernameField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.usernameErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validateUsername,
            decoration: InputDecoration(
              hintText: "username",
              labelText: "Username",
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              prefixIcon: const Icon(FluentIcons.person_20_regular),
            ),
          );
        });
  }
}
