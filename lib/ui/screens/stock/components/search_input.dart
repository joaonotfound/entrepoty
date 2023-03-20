import 'package:flutter/material.dart';

class StockSearchInput extends StatelessWidget {
  const StockSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search), hintText: "Search for product"),
      ),
    );
  }
}
