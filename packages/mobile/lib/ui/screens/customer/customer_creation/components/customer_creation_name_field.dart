import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../ui.dart';

class CustomerCreationName extends StatelessWidget {
  const CustomerCreationName({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<CustomerCreationPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.nameErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validateName,
            decoration: InputDecoration(
              hintText: "Josh Natael",
              labelText: "Name",
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              prefixIcon: const Icon(FluentIcons.person_16_regular),
            ),
          );
        });
  }
}
