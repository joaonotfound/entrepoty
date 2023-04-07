import 'package:flutter/material.dart';

class BottomBarScreen {
  final Widget Function() widget;
  final Icon icon;
  final String label;
  BottomBarScreen({
    required this.widget,
    required this.icon,
    required this.label,
  });
}
