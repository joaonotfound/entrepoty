import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';

class ModelsScreen extends StatefulWidget {
  const ModelsScreen({super.key});

  @override
  State<ModelsScreen> createState() => _ModelsScreenState();
}

class _ModelsScreenState extends State<ModelsScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      body: Center(
        child: Text("Modelos!"),
      ),
    );
  }
}
