import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

class LaunchLoginButton extends StatelessWidget {
  const LaunchLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0
      ),
      onPressed: () => Get.toNamed(Routes.login),
      child: const Text(
        "Login",
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
