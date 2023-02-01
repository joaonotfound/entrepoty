import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/ui.dart';

class UserPasswordField extends StatelessWidget {
  const UserPasswordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 30),
      child: StreamBuilder<String?>(
          stream: presenter.passwordErrorStream,
          builder: (context, snapshot) {
            return TextFormField(
              onChanged: presenter.validatePassword,
              decoration: InputDecoration(
                labelText: "Senha",
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data,
                prefixIcon: Icon(
                  Icons.lock,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              obscureText: true,
            );
          }),
    );
  }
}
