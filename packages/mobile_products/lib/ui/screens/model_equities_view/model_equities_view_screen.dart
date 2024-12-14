import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../components/components.dart';

class ModelEquitiesView extends StatelessWidget {
  List<ProductDetailEntity> details;

  ModelEquitiesView({
    required this.details, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemBuilder: (context, index) => ProductDetailTile(detail: details[index]),
          itemCount: details.length,
        ),
      ),
    );
  }
}
