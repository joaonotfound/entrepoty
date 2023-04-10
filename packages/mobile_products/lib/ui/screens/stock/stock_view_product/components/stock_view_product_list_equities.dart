import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_products/ui/components/equity_list_tile.dart';

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
                child: EquityListTile(detail: products[index],)
              ),
            ),
            childCount: products.length,
          ),
        );
}
