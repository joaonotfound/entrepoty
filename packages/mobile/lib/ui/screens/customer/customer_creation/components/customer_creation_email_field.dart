import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui.dart';

class CustomerCreationEmailField extends StatelessWidget {
  const CustomerCreationEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<CustomerCreationPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validateEmail,
            decoration: InputDecoration(
              hintText: "email@email.com",
              labelText: "Email",
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              prefixIcon: const Icon(FluentIcons.mail_12_regular),
            ),
          );
        });
  }
}
