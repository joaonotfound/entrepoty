import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../../../../domain/domain.dart';
import '../model_list_presenter.dart';

class ModelListCard extends StatelessWidget {
  final ProductModelEntity model;

  const ModelListCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelListPresenter>(context);
    final backend = Get.find<BackendProvider>();

    const border = 5.0;
    return InkWell(
      onTap: () => Get.toNamed(Routes.getViewModel(model.id)),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
        elevation: 0,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(border),
                topRight: Radius.circular(border),
              ),
              child: FutureBuilder<String>(
                  future: backend.loadResource(model.imagePath),
                  initialData: "",
                  builder: (context, snapshot) {
                    return Image.network(
                      snapshot.data!,
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          color: Theme.of(context).colorScheme.onSurface,
                          height: 250,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FluentIcons.image_16_regular,
                                size: 50,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Missing image",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.surface),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }),
            ),
            ListTile(
              title: Text(model.name),
              subtitle: Text(model.category),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const ListTile(
                      leading: Icon(FluentIcons.delete_12_regular),
                      title: Text("Delete"),
                    ),
                    onTap: () => presenter.deleteModel(model.id),
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
