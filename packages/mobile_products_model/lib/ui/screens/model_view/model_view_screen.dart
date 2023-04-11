import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_products_model/mobile_products_model.dart';
import '../../../domain/domain.dart';
import 'components/components.dart';
import 'model_view_presenter.dart';

class ModelViewScreen extends StatelessWidget {
  final ModelViewPresenter presenter;

  ModelViewScreen({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put<ModelViewPresenter>(presenter);

    final id = int.parse(Get.parameters['id'] ?? '0');
    presenter.loadModel(id);

    return StreamBuilder<ProductModelAndDetails?>(
      stream: presenter.modelStream,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            actions: snapshot.data == null
                ? null
                : [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => ModelViewBottomSheet(
                            model: snapshot.data!.product,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                    )
                  ],
            backgroundColor: Colors.transparent,
          ),
          backgroundColor: Colors.black,
          body: SafeArea(
            child: snapshot.data == null
                ? const Loading()
                : Card(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        ModelViewImage(model: snapshot.data!.product),
                        ModelViewDescription(model: snapshot.data!.product),
                        ElevatedButton(
                          onPressed: () => Get.to(
                              ModelEquitiesViewWithGenerate(
                                details: snapshot.data!.details,
                                product: snapshot.data!.product,
                              ),
                              transition: Transition.downToUp
                          ),
                          child: const Text("Show equities"),
                        )
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
