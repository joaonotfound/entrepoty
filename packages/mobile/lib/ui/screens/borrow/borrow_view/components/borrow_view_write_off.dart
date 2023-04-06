import 'package:flutter/material.dart';

class BorrowViewWriteOff extends StatelessWidget {
  const BorrowViewWriteOff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton.icon(onPressed: (){}, label: Text("Write off"), icon: Icon(Icons.refresh),),
    );
  }
}
