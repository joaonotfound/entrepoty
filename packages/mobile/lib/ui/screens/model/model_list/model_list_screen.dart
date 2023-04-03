import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/screens/model/model_list/components/components.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ModelListScreen extends StatelessWidget with UiErrorManager {
  ModelListPresenter presenter;
  ModelListScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    presenter.loadModels();
    return Builder(builder: (context) {
      handleUiError(context, presenter.mainErrorStream);
      return HomeLayout(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => presenter.loadModels(),
            ),
            IconButton(
              icon: const Icon(FluentIcons.search_12_regular),
              onPressed: () => Get.to(
                const SearchScreen(),
                transition: Transition.rightToLeft,
              ),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => presenter.loadModels(),
          child: StreamBuilder(
            stream: presenter.modelsEntity,
            builder: (context, modelsSnapshot) {
              return StreamBuilder(
                stream: presenter.isLoadingStream,
                builder: (context, isLoadingSnapshot) {
                  return isLoadingSnapshot.data == true
                      ? Center(child: Text("Loading"))
                      : modelsSnapshot.data?.isNotEmpty == true
                          ? ListenableProvider(
                              create: (context) => presenter,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: modelsSnapshot.data!.length,
                                  itemBuilder: ((context, index) =>
                                      ModelListCard(
                                          model: modelsSnapshot.data![index]))),
                            )
                          : const Center(
                              child: Text("Couldn't find any models"));
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "create-model",
          onPressed: () => Get.toNamed(Routes.createModel),
          icon: const Icon(Icons.add),
          label: const Text("Model"),
        ),
      );
    });
  }
}
