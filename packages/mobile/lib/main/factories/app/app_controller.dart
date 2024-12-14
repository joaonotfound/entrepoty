import 'package:entrepoty/main/factories/factories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

Obx makeAppController() {
  final List<BottomBarScreen> screens = Get.put(makeBottomBarScreens());
  List<Widget> getPages() {
    return screens.map((e) => e.widget()).toList();
  }

  final BottomBarController appController = Get.put(BottomBarController());

  return Obx(
    () => IndexedStack(
      index: appController.tabIndex.value,
      children: getPages(),
    ),
  );
}
