import 'package:flutter/material.dart';

class UserEmailField extends StatelessWidget {
  const UserEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text("Email"),
        prefixIcon: Icon(Icons.email),
        hintText: "E-mail",
      ),
    );
  }
}
