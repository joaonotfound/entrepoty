import 'package:flutter/material.dart';

import 'drawer_item.dart';
import 'drawer_item_widget.dart';

Drawer makeDrawer(BuildContext context) {
  final List<DrawerItem> options = [
    const DrawerItem(name: "Estoque", icon: Icons.folder, selected: true),
    const DrawerItem(name: "Empréstimos", icon: Icons.folder, selected: false),
    const DrawerItem(name: "Modelos", icon: Icons.folder, selected: false),
    const DrawerItem(
        name: "Usuários", icon: Icons.account_box, selected: false),
  ];
  return Drawer(
    backgroundColor: Theme.of(context).primaryColor,
    child: SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          ...options.map(
            (e) => DrawerItemWidget(
              item: e,
            ),
          )
        ],
      ),
    ),
  );
}
