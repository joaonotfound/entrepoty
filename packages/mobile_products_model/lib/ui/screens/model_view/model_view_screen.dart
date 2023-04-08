import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
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
                      icon: Icon(Icons.more_vert),
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
                        ModelViewImage(model: snapshot.data!),
                        ModelViewDescription(model: snapshot.data!)
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
