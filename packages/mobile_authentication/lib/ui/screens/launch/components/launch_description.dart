import 'package:flutter/material.dart';

class LaunchDescription extends StatelessWidget {
  const LaunchDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Column(
        children: [
          Text(
            'Easy Online Management',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Text(
            'Make your experience managing your storage easier.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
