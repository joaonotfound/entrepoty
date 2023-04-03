import 'package:flutter/material.dart';

class BorrowCreationDevolution extends StatelessWidget {
  const BorrowCreationDevolution({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.calendar_today),
        labelText: "Enter Date",
      ),
      readOnly: true,
      onTap: () {},
    );
  }
}
