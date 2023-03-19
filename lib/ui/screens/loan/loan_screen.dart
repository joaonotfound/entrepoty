import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      body: Center(
        child: Text("Tela de empréstimos."),
      ),
    );
  }
}
