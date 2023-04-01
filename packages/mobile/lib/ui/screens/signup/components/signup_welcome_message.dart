import 'package:flutter/material.dart';

class SignupWelcomeMessage extends StatelessWidget {
  const SignupWelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Join Entrepoty",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            "Create an account to access exclusive features and personalized content! It only takes a minute to sign up.",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
