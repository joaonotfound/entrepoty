import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomerEnrollmentField extends StatelessWidget {
  const CustomerEnrollmentField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.person_accounts_20_regular),
        label: Text("Enrollment"),
        hintText: "Enrollment's id",
      ),
    );
  }
}
