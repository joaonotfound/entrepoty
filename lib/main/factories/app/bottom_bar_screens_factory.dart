import 'package:flutter/material.dart';
import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/ui/ui.dart';

List<BottomBarScreen> makeBottomBarScreens() {
  return [
    BottomBarScreen(
      widget: () => makeStockListScreen(),
      icon: Icon(Icons.folder),
      label: "Estoque",
    ),
    BottomBarScreen(
      widget: () => ModelListScreen(),
      icon: Icon(Icons.model_training),
      label: "Modelos",
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
