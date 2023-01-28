import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class UserPasswordField extends StatelessWidget {
  final LoginPresenter loginPresenter;
  const UserPasswordField({Key? key, required this.loginPresenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: loginPresenter.validatePassword,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: "Senha",
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
  }
}
