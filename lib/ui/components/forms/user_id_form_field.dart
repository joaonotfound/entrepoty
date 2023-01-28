import 'package:flutter/material.dart';

class UserIdFormField extends StatelessWidget {
  const UserIdFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
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
    );
  }
}
