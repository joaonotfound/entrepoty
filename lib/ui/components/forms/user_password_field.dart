import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class UserPasswordField extends StatelessWidget {
  final LoginPresenter loginPresenter;
  const UserPasswordField({Key? key, required this.loginPresenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String?>(
        stream: loginPresenter.passwordErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: loginPresenter.validatePassword,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Senha",
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                )),
            obscureText: true,
          );
        });
  }
}
