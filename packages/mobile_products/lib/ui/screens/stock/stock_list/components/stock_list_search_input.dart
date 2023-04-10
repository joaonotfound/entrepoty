import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class StockListSearchInput extends StatelessWidget {
  const StockListSearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(FluentIcons.search_16_regular),
            hintText: "Search for product"),
      ),
    );
  }
}
