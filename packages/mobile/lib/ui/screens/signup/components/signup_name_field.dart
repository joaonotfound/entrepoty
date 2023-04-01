import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SignupNameField extends StatelessWidget {
  const SignupNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.person_12_regular),
        hintText: "Your full name",
        label: Text("Name"),
      ),
    );
  }
}
