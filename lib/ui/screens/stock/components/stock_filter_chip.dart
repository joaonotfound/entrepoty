import 'package:flutter/material.dart';

class StockFilterChip extends StatefulWidget {
  final String text;
  const StockFilterChip({
    super.key,
    required this.text,
  });

  @override
  State<StockFilterChip> createState() => _StockFilterChipState();
}

class _StockFilterChipState extends State<StockFilterChip> {
  bool _activated = false;
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      onSelected: (selected) {
        setState(() {
          _activated = selected;
        });
      },
      selected: _activated,
      backgroundColor: Color(0xFF9DA8C1),
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
      label: Text(widget.text.toLowerCase()),
      labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    );
  }
}
