import 'package:flutter/material.dart';
import 'package:service_desk_2/main/factories/pages/stock/stock_screen_factory.dart';
import 'package:service_desk_2/ui/ui.dart';

List<HomeScaffoldScreen> makeHomeScaffoldScreens() {
  return [
    HomeScaffoldScreen(
        widget: makeStockScreen(), icon: Icon(Icons.folder), label: "Estoque"),
    HomeScaffoldScreen(
      widget: Center(child: Text("Tela de empréstimos")),
      icon: Icon(Icons.folder_shared),
      label: "Empréstimos",
    ),
    HomeScaffoldScreen(
      widget: Center(child: Text("Tela de usuários")),
      icon: Icon(Icons.account_box_outlined),
      label: "Usuários",
    )
  ];
}
