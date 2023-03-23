import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';

class ModelCreationScreen extends StatelessWidget {
  ModelCreationPresenter presenter;
  ModelCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return FormLayout(
      content: Center(child: Text("Create model")),
      action: ElevatedButton(
        child: Text("Create"),
        onPressed: () {},
      ),
      title: "Create Model",
    );
  }
}
