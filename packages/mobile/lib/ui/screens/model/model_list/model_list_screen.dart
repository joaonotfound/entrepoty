import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelListScreen extends StatefulWidget {
  const ModelListScreen({super.key});

  @override
  State<ModelListScreen> createState() => _ModelListScreenState();
}

class _ModelListScreenState extends State<ModelListScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.createModel),
        label: Text("Create model"),
        icon: Icon(Icons.add),
        heroTag: "add-model",
      ),
      body: Center(
        child: Text("Models!"),
      ),
    );
  }
}
