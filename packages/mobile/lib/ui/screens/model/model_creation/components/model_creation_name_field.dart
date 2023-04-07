import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelCreationNameField extends StatelessWidget {
  const ModelCreationNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelCreationPresenter>(context);
    return StreamBuilder<String?>(
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
        });
  }
}
