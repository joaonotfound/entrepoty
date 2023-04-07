import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      child: Text(
        "Login",
        style: TextStyle(
          color: Color(0xff0014cc),
          fontWeight: FontWeight.w400
        ),
      ),
    );
  }
}
