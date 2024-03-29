import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

class LoginSignupRedirect extends StatelessWidget {
  const LoginSignupRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: OutlinedButton(
        onPressed: () => Get.offAndToNamed(Routes.signup),
        child: Text("Create an account"),
      ),
    );
  }
}
