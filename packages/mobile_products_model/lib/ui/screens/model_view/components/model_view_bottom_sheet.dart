import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../domain/domain.dart';
import '../../../ui.dart';

class ModelViewBottomSheet extends StatelessWidget {
  final ProductModelEntity model;

  ModelViewBottomSheet({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<ModelViewPresenter>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: Icon(FluentIcons.delete_12_regular),
        label: Text("Delete"),
        onPressed: () async {
          await presenter.deleteModel(model.id);
          Get.back();
        },
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          backgroundColor: MaterialStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }
}
