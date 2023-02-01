import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterLotItemScreen extends StatefulWidget {
  const RegisterLotItemScreen({super.key});

  @override
  State<RegisterLotItemScreen> createState() => _RegisterLotItemScreenState();
}

class _RegisterLotItemScreenState extends State<RegisterLotItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Registrar lot"),
          leading: IconButton(
            onPressed: () => Get.offNamed("/stock/create_item"),
            icon: Icon(Icons.close),
          )),
      body: Center(
        child: Text("RegisterLotItemScreen screen!"),
      ),
    );
  }
}
