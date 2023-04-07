import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_borrow/mobile_borrow.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products_model/mobile_products_model.dart';
import 'package:mobile_products/mobile_products.dart';

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
