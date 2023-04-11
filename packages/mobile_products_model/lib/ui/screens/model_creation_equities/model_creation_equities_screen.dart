import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_products_model/mobile_products_model.dart';

class ModelCreationEquitiesScreen extends StatelessWidget {
  ProductModelEntity product;

  final qtdController = TextEditingController();
  ModelCreationEquitiesScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<ModelViewPresenter>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Generate equities"),),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Form(
                  child: TextFormField(
                    controller: qtdController,
                    decoration: const InputDecoration(
                      hintText: "20",
                      label: Text("Quantity"),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () => presenter.generateDetail(product, int.parse(qtdController.value.text)),
                child: const Text("Generate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
