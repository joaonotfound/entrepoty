import 'package:flutter/material.dart';

class DrawerItem {
  final String name;
  final IconData icon;
  final bool selected;
  const DrawerItem({
    required this.name,
    required this.icon,
    required this.selected,
  });
}
