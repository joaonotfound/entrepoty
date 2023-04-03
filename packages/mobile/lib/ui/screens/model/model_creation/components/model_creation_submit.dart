import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class ModelCreationSubmit extends StatelessWidget {
  const ModelCreationSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelCreationPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed:
                snapshot.data == true ? () => presenter.createModel() : null,
            child: const Text("Create"),
          );
        });
  }
}
