import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        label: Text('Name'),
        prefixIcon: Icon(FluentIcons.person_16_regular),
        hintText: 'Name',
      ),
    );
  }
}
