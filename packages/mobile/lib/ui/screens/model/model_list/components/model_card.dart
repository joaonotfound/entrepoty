import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelListCard extends StatelessWidget {
  ProductModelEntity model;
  ModelListCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ModelListPresenter>(context);
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      leading: Icon(FluentIcons.production_20_regular),
      title: Text(model.name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: ListTile(
              leading: Icon(FluentIcons.delete_12_regular),
              title: Text("Delete"),
            ),
            onTap: () => provider.deleteModel(model.id),
          )
        ],
      ),
    );
  }
}
