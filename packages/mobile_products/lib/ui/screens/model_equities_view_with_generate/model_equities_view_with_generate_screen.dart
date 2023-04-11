import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domain.dart';
import '../../ui.dart';

class ModelEquitiesViewWithGenerate extends StatelessWidget {
  final ProductModelEntity product;
  final List<ProductDetailEntity> details;

  ModelEquitiesViewWithGenerate({
    Key? key,
    required this.product,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Equities"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: ProductDetailTile(detail: details[index])),
          ),
          itemCount: details.length,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton.icon(
            onPressed: () => Get.to(
              ModelCreationEquitiesScreen(product: product),
            ),
            icon: const Icon(FluentIcons.box_20_regular),
            label: const Text("Generate Equity"),
          ),
        ),
      ),
    );
  }
}
