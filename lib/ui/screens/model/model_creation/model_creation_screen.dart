import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';

class ModelCreationScreen extends StatelessWidget {
  const ModelCreationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      content: Center(child: Text("Create model")),
      action: ElevatedButton(
        child: Text("Criar"),
        onPressed: () {},
      ),
      title: "Create Model",
    );
  }
}
