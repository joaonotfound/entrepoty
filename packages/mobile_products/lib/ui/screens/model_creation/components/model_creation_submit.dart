import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_creation_presenter.dart';

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
            child: const Text('Create'),
          );
        },);
  }
}
