import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LaunchSignupButton extends StatelessWidget {
  const LaunchSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        elevation: 0,
        side: BorderSide(color: Colors.white70, width: 1),
      ),
      onPressed: () => Get.toNamed(Routes.signup),
      child: Text("Sign up"),
    );
  }
}
