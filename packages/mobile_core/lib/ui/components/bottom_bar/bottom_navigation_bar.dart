import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui.dart';

Widget makeBottomNavigationBar() {
  final List<BottomBarScreen> screens = Get.find();
  final BottomBarController appController = Get.find();
  return BottomNavigationBar(
    currentIndex: appController.tabIndex.value,
    onTap: (value) => appController.changeTabIndex(value),
    type: BottomNavigationBarType.fixed,
    items: screens
        .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
        .toList(),
  );
}
