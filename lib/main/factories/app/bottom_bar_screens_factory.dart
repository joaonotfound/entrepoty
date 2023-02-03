import 'package:flutter/material.dart';
import 'package:service_desk_2/main/factories/factories.dart';
import 'package:service_desk_2/main/factories/pages/stock/stock_screen_factory.dart';
import 'package:service_desk_2/ui/ui.dart';

List<BottomBarScreen> makeBottomBarScreens() {
  return [
    BottomBarScreen(
      widget: () => makeStockScreen(),
      icon: Icon(Icons.folder),
      label: "Estoque",
    ),
    BottomBarScreen(
      widget: () => makeLoanScreen(),
      icon: Icon(Icons.folder_shared),
      label: "Empréstimos",
    ),
    BottomBarScreen(
      widget: () => makeUsersScreen(),
      icon: Icon(Icons.account_box_outlined),
      label: "Usuários",
    )
  ];
}
