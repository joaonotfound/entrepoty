import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';

class BorrowScreen extends StatelessWidget {
  const BorrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      body: Center(
        child: Text("Borrow screen."),
      ),
    );
  }
}
