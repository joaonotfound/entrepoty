

import 'package:flutter/material.dart';

class CustomerViewDelete extends StatelessWidget {
  const CustomerViewDelete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Delete"),
      ),
    );
  }
}
