import 'package:entrepoty/main/factories/pages/models_list/models_list_screen_factory.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:entrepoty/main/factories/factories.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';

List<BottomBarScreen> makeBottomBarScreens() {
  return [
    BottomBarScreen(
      widget: () => makeStockListScreen(),
      icon: Icon(FluentIcons.box_20_filled),
      label: "Stock",
    ),
    BottomBarScreen(
      widget: () => makeModelListScreen(),
      icon: Icon(FluentIcons.box_edit_20_filled),
      label: "Models",
    ),
    BottomBarScreen(
      widget: () => makeBorrowScreen(),
      icon: Icon(FluentIcons.group_20_filled),
      label: "Borrows",
    ),
    BottomBarScreen(
      widget: () => makeCustomerListScreen(),
      icon: Icon(FluentIcons.person_board_20_filled),
      label: "Customers",
    )
  ];
}
