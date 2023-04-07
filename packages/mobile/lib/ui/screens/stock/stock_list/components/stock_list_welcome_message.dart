import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class StockListWelcomeMessage extends StatelessWidget {
  const StockListWelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockListPresenter>(context);
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
        Row(
          
          children: [
            IconButton(
                icon: Icon(FluentIcons.arrow_clockwise_16_regular),
                onPressed: () => presenter.loadScreen()),
            IconButton(
                icon: Icon(FluentIcons.settings_20_regular),
                onPressed: () => Get.toNamed(Routes.settings))
          ],
        )
      ],
    );
  }
}
