import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_products/domain/domain.dart';

import '../../../ui.dart';

class ModelEquitiesViewWithGenerateSubmit extends StatelessWidget {
  final ProductModelEntity product;

  const ModelEquitiesViewWithGenerateSubmit({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton.icon(
        onPressed: () => Get.to(
          ModelCreationEquitiesScreen(product: product),
        ),
        icon: const Icon(FluentIcons.box_20_regular),
        label: const Text("Generate Equity"),
      ),
    );
  }
}
