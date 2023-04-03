import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../misc/misc.dart';

class BorrowScreen extends StatelessWidget {
  const BorrowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      body: Center(
        child: Text("Borrow screen."),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "create-borrow",
        onPressed: () => Get.toNamed(Routes.createBorrow),
        icon: const Icon(Icons.add),
        label: const Text("Borrow"),
      ),
    );
  }
}
