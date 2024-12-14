import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class UserEmailField extends StatelessWidget {
  const UserEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        label: Text('Email'),
        prefixIcon: Icon(FluentIcons.mail_16_regular),
        hintText: 'E-mail',
      ),
    );
  }
}
