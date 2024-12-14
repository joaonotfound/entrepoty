import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../../domain/domain.dart';

class ModelViewImage extends StatelessWidget {
  final ProductModelEntity model;

  const ModelViewImage({
    required this.model, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backend = Get.find<BackendProvider>();
    return Expanded(
      flex: 1,
      child: FutureBuilder(
          initialData: '',
          future: backend.loadResource(model.imagePath),
          builder: (context, snapshot) {
            return snapshot.data == null
                ? Container(
                    color: Theme.of(context).colorScheme.surface,
                    width: MediaQuery.of(context).size.width,
                    child: const Icon(FluentIcons.image_16_regular),
                  )
                : Image.network(
                    snapshot.data!,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    errorBuilder: (_, __, ___) => Container(
                      color: Theme.of(context).colorScheme.surface,
                      width: MediaQuery.of(context).size.width,
                      child: const Icon(FluentIcons.image_16_regular),
                    ),
                  );
          },),
    );
  }
}
