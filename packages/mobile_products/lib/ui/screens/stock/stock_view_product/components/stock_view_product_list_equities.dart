import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/domain.dart';

class StockViewProductListEquities extends SliverList {
  final List<ProductDetailEntity> products;

  StockViewProductListEquities({
    required this.products,
  }) : super(
          delegate: SliverChildBuilderDelegate(
            (context, index) => InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  leading: const CircleAvatar(
                    child: Icon(FluentIcons.box_16_regular),
                  ),
                  title: const Text("Equity"),
                  subtitle: Text(products[index].equity),
                ),
              ),
            ),
            childCount: products.length,
          ),
        );
}
