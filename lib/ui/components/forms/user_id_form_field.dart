import 'package:flutter/material.dart';

class UserIdFormField extends StatelessWidget {
  const UserIdFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: "ma-00000-0",
            labelText: "Matrícula",
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
            prefixIcon: Icon(
              Icons.account_circle,
              color: Theme.of(context).primaryColor,
            ),
            alignLabelWithHint: true),
      ),
    );
  }
}
