import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_borrow/mobile_borrow.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products/mobile_products.dart';
import 'package:mobile_settings/mobile_settings.dart';

List<BottomBarScreen> makeBottomBarScreens() {
  return [
    BottomBarScreen(
      widget: () => makeModelListScreen(),
      icon: const Icon(FluentIcons.box_edit_20_filled),
      label: "Products",
    ),
    BottomBarScreen(
      widget: () => makeBorrowScreen(),
      icon: const Icon(FluentIcons.group_20_filled),
      label: "Borrows",
    ),
    BottomBarScreen(
      widget: () => makeCustomerListScreen(),
      icon: const Icon(FluentIcons.person_board_20_filled),
      label: "Customers",
    ),
    BottomBarScreen(
      widget: () => makeSettingsScreen(),
      icon: const Icon(FluentIcons.settings_24_regular),
      label: "Settings",
    ),
  ];
}
