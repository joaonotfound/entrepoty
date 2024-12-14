import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';

class ModelViewDescription extends StatelessWidget {
  final ProductModelEntity model;

  const ModelViewDescription({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(child: Icon(FluentIcons.box_20_regular),),
            title: const Text("Product"),
            subtitle: Text(model.name),
          ),
          ListTile(
            leading: const CircleAvatar(child: Icon(FluentIcons.organization_20_regular),),
            title: const Text("Category"),
            subtitle: Text(model.category),
          ),
        ],
      ),
    );
  }
}
