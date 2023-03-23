import './components/components.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset("lib/ui/assets/launch_image.png"),
                  flex: 1,
                ),
                Container(
                  color: Theme.of(context).colorScheme.surface,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        LaunchDescription(),
                        Column(
                          children: [
                            LaunchLoginButton(),
                            SizedBox(height: 5),
                            LaunchSignupButton()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
