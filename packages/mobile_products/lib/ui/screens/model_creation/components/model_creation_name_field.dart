import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_creation_presenter.dart';

class ModelCreationNameField extends StatelessWidget {
  const ModelCreationNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelCreationPresenter>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: StreamBuilder<String?>(
          stream: presenter.nameErrorStream,
          builder: (context, snapshot) {
            return TextFormField(
              onChanged: presenter.validateName,
              decoration: InputDecoration(
                hintText: "Logitech Keyboard",
                labelText: "Model's name",
                errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
                prefixIcon: const Icon(FluentIcons.person_16_regular),
              ),
            );
          }),
    );
  }
}
