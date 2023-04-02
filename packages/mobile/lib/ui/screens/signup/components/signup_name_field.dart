import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupNameField extends StatelessWidget {
  const SignupNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<SignupPresenter>(context);
    return StreamBuilder<String?>(
      stream: presenter.nameErrorStream,
      builder: (context, snapshot) => TextFormField(
        onChanged: presenter.validateName,
        decoration: InputDecoration(
          prefixIcon: Icon(FluentIcons.person_12_regular),
          errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
          hintText: "Your full name",
          label: Text("Name"),
        ),
      ),
    );
  }
}
