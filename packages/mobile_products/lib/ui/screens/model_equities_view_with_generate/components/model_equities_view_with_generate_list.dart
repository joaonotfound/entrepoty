
import 'package:flutter/material.dart';
import 'package:mobile_products/domain/domain.dart';

import '../../../components/components.dart';

class ModelEquitiesViewWithGenerateList extends StatelessWidget {
  final List<ProductDetailEntity> details;
  const ModelEquitiesViewWithGenerateList({required this.details, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
            child: ProductDetailTile(detail: details[index]),),
      ),
      itemCount: details.length,
    );
  }
}
