import 'package:entrepoty/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../providers/providers.dart';

class ModelViewImage extends StatelessWidget {
  ProductModelEntity model;

  ModelViewImage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backend = Get.find<BackendProvider>();
    return Expanded(
      flex: 1,
      child: Image.network(
        fit: BoxFit.fill,
        backend.loadResource(model.imagePath),
      ),
    );
  }
}
