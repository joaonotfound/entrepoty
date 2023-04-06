import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/providers/providers.dart';
import 'package:entrepoty/ui/screens/model/model_view/components/components.dart';
import 'package:entrepoty/ui/screens/model/model_view/model_view_presenter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class ModelViewScreen extends StatelessWidget {
  ModelViewPresenter presenter;

  ModelViewScreen({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backend = Get.find<BackendProvider>();
    Get.put<ModelViewPresenter>(presenter);

    final id = int.parse(Get.parameters['id'] ?? '0');
    presenter.loadModel(id);

    return StreamBuilder<ProductModelEntity?>(
      stream: presenter.modelStream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back),
            ),
            actions: snapshot.data == null
                ? null
                : [
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => ModelViewBottomSheet(
                              model: snapshot.data!,
                            ),
                          );
                        },
                        icon: Icon(Icons.more_vert))
                  ],
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: snapshot.data == null
                ? Center(child: Text("Loading"))
                : Card(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            fit: BoxFit.fill,
                            backend.loadResource(snapshot.data!.imagePath),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            snapshot.data!.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            snapshot.data!.category,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
