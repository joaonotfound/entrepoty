import 'package:flutter/material.dart';

class SignupSubmit extends StatefulWidget {
  const SignupSubmit({super.key});

  @override
  State<SignupSubmit> createState() => _SignupSubmitState();
}

class _SignupSubmitState extends State<SignupSubmit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: () {},
        child: Text("Sign up"),
      ),
    );
  }
}
