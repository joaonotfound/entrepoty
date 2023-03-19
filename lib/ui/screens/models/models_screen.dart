import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModelsScreen extends StatefulWidget {
  const ModelsScreen({super.key});

  @override
  State<ModelsScreen> createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
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
        child: Text("Modelos!"),
      ),
    );
  }
}
