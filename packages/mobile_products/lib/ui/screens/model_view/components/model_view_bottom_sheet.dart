import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/domain.dart';
import '../../../ui.dart';

class ModelViewBottomSheet extends StatelessWidget {
  final ProductModelEntity model;

  const ModelViewBottomSheet({
    required this.model, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<ModelViewPresenter>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: ElevatedButton.icon(
        icon: const Icon(FluentIcons.delete_12_regular),
        label: const Text('Delete'),
        onPressed: () async {
          await presenter.deleteModel(model.id);
          Get.back();
        },
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          foregroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.onSurface),
          backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
        ),
      ),
    );
  }
}
