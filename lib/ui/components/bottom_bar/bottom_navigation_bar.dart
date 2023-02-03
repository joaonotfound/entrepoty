import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui.dart';

Widget makeBottomNavigationBar() {
  List<BottomBarScreen> screens = Get.find();
  BottomBarController appController = Get.find();
  return SizedBox(
    height: 64,
    child: BottomNavigationBar(
      currentIndex: appController.tabIndex.value,
      onTap: (value) => appController.changeTabIndex(value),
      items: screens
          .map((e) => BottomNavigationBarItem(icon: e.icon, label: e.label))
          .toList(),
    ),
  );
}
