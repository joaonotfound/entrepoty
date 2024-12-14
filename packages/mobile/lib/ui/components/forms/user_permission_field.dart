import 'package:flutter/material.dart';

class UserPermissionField extends StatelessWidget {
  const UserPermissionField({super.key});

  @override
  Widget build(BuildContext context) {
    final modelos = [
      "Employee",
      "Administrator",
    ];
    return DropdownButtonFormField(
      hint: const Text("Permission"),
      items: modelos
          .map((label) => DropdownMenuItem<String>(
                value: label,
                child: Text(label),
              ))
          .toList(),
      onChanged: (_) {},
    );
  }
}
