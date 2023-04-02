import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class UserSectorField extends StatelessWidget {
  const UserSectorField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(FluentIcons.organization_12_regular),
        label: Text("Sector"),
        hintText: "Company's sector",
      ),
    );
  }
}
