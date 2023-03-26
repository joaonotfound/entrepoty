import 'package:flutter/material.dart';
import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/ui/ui.dart';

List<BottomBarScreen> makeBottomBarScreens() {
  return [
    BottomBarScreen(
      widget: () => makeStockListScreen(),
      icon: Icon(Icons.folder),
      label: "Stock",
    ),
    BottomBarScreen(
      widget: () => ModelListScreen(),
      icon: Icon(Icons.model_training),
      label: "Models",
    ),
    BottomBarScreen(
      widget: () => makeBorrowScreen(),
      icon: Icon(Icons.folder_shared),
      label: "Borrows",
    ),
    BottomBarScreen(
      widget: () => makeUserListScreen(),
      icon: Icon(Icons.account_box_outlined),
      label: "Users",
    )
  ];
}
