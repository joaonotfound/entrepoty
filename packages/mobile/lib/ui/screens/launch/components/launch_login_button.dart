import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchLoginButton extends StatelessWidget {
  const LaunchLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.toNamed('/login', parameters: {}),
      child: Text("Login"),
    );
  }
}
