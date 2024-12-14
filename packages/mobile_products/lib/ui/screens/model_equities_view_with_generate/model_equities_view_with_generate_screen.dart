import 'package:flutter/material.dart';
import 'package:mobile_products/ui/screens/model_equities_view_with_generate/components/components.dart';

import '../../../domain/domain.dart';

class ModelEquitiesViewWithGenerate extends StatelessWidget {
  final ProductModelEntity product;
  final List<ProductDetailEntity> details;

  const ModelEquitiesViewWithGenerate({
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
        body: ModelEquitiesViewWithGenerateList(details: details,),
        bottomNavigationBar: ModelEquitiesViewWithGenerateSubmit(product: product,)
      ),
    );
  }
}
