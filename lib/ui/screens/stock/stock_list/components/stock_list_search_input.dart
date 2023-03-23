import 'package:flutter/material.dart';

class StockListSearchInput extends StatelessWidget {
  const StockListSearchInput({super.key});

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
