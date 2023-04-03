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
    return InkWell(
      child: Card(
        margin: EdgeInsets.only(),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FluentIcons.production_20_regular),
              Text(model.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}
