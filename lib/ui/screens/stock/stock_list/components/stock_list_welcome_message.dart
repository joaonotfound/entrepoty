import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../misc/misc.dart';

class StockListWelcomeMessage extends StatelessWidget {
  const StockListWelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, name!",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Welcome to your storage.",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        IconButton(
            icon: Icon(FluentIcons.settings_16_regular),
            onPressed: () => Get.toNamed(Routes.settings))
      ],
    );
  }
}
