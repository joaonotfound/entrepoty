import 'package:flutter/material.dart';

class ModelCreationImagePicker extends StatelessWidget {
  const ModelCreationImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton.icon(onPressed: (){}, label: Text("Pick image"), icon: Icon(Icons.camera),),
    );
  }
}
