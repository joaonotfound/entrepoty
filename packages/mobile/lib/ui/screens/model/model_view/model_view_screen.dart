import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/providers/providers.dart';
import 'package:entrepoty/ui/screens/model/model_view/components/components.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class ModelViewScreen extends StatelessWidget {
  ProductModelEntity model;
  ModelListPresenter presenter;

  ModelViewScreen({
    Key? key,
    required this.model,
    required this.presenter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backend = Get.find<BackendProvider>();
    Get.put<ModelListPresenter>(presenter);

    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => ModelViewBottomSheet(model: model,)
                  );
                },
                icon: Icon(Icons.more_vert))
          ],
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Card(
          color: Colors.transparent,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(
                  fit: BoxFit.fill,
                  backend.loadResource(model.imagePath),
                ),
              ),
              ListTile(
                title: Text(
                  model.name,
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  model.category,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
