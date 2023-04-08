import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../../domain/domain.dart';

class ModelViewImage extends StatelessWidget {
  final ProductModelEntity model;

  ModelViewImage({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backend = Get.find<BackendProvider>();
    return Expanded(
      flex: 1,
      child: FutureBuilder(
        initialData: "",
        future: backend.loadResource(model.imagePath),
        builder: (context, snapshot) {
          return Image.network(
            snapshot.data!,
            fit: BoxFit.fill,
          );
        }
      ),
    );
  }
}
