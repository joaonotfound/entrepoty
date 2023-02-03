import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/ui.dart';

class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: makeBottomNavigationBar(),
      body: Center(child: Text("Tela de empréstimos.")),
    );
  }
}
