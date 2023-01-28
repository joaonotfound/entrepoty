import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

class UserIdFormField extends StatelessWidget {
  final LoginPresenter loginPresenter;
  const UserIdFormField({Key? key, required this.loginPresenter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: loginPresenter.validateId,
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
