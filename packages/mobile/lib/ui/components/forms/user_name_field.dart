import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text("Name"),
        prefixIcon: Icon(Icons.account_circle),
        hintText: "Name",
      ),
    );
  }
}
