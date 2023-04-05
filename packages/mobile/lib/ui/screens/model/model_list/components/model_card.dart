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
    final border = 5.0;
    return InkWell(
      onTap: () {},
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
        elevation: 0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(border),
                topRight: Radius.circular(border),
              ),
              child: Image.network(
                "http://10.0.2.2:8080" + model.imagePath,
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(FluentIcons.production_20_regular);
                },
              ),
            ),
            ListTile(
              title: Text(model.name),
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
            )
          ],
        ),
      ),
    );
  }
}
