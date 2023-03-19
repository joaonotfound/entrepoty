import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/ui/ui.dart';

Obx makeAppController() {
  List<BottomBarScreen> screens = Get.put(makeBottomBarScreens());
  List<Widget> getPages() {
    return screens.map((e) => e.widget()).toList();
  }

  final BottomBarController appController = Get.put(BottomBarController());

  return Obx(
    () => IndexedStack(
      children: getPages(),
      index: appController.tabIndex.value,
    ),
  );
}
