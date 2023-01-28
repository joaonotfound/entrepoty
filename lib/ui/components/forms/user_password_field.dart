import 'package:flutter/material.dart';

class UserPasswordField extends StatelessWidget {
  const UserPasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        decoration: InputDecoration(
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
      ),
    );
  }
}
