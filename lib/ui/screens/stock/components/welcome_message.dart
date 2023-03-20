import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, name!",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Welcome to your storage.",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        Icon(Icons.settings)
      ],
    );
  }
}
