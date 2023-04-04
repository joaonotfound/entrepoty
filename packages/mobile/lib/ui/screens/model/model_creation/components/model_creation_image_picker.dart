import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model_creation_presenter.dart';

class ModelCreationImagePicker extends StatelessWidget {
  const ModelCreationImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelCreationPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.hasImageStream,
        builder: (context, snapshot) {
          final photo = snapshot.data == true;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton.icon(
              onPressed: () =>
                  photo ? presenter.deletePhoto() : presenter.pickImage(),
              label: Text(photo ? "Remove photo" : "Take photo"),
              icon: Icon(photo ? Icons.close : Icons.camera),
            ),
          );
        });
  }
}
