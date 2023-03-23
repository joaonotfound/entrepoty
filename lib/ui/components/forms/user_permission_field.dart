import 'package:flutter/material.dart';

class UserPermissionField extends StatelessWidget {
  const UserPermissionField({super.key});

  @override
  Widget build(BuildContext context) {
    final _modelos = [
      "Employee",
      "Administrator",
    ];
    return DropdownButtonFormField(
      hint: Text("Permission"),
      items: _modelos
          .map((label) => DropdownMenuItem<String>(
                value: label,
                child: Text(label),
              ))
          .toList(),
      onChanged: (_) {},
    );
  }
}
