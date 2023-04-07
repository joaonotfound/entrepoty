import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';

import 'model_list_presenter.dart';

class ModelListScreen extends StatefulWidget {
  final ModelListPresenter presenter;

  ModelListScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<ModelListScreen> createState() => _ModelListScreenState();
}

class _ModelListScreenState extends State<ModelListScreen> with UiErrorManager {
  @override
  void initState() {
    widget.presenter.loadModels();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      handleUiError(context, widget.presenter.mainErrorStream);
      return HomeLayout(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(FluentIcons.arrow_clockwise_16_regular),
              onPressed: () => widget.presenter.loadModels(),
            ),
            IconButton(
                icon: const Icon(FluentIcons.search_16_regular),
                onPressed: () {
                  Get.put(widget.presenter);
                  // Get.to(
                  //   const SearchScreen(),
                  //   transition: Transition.rightToLeft,
                  // );
                })
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => widget.presenter.loadModels(),
          child: StreamBuilder(
            stream: widget.presenter.modelsEntity,
            builder: (context, modelsSnapshot) {
              return StreamBuilder(
                stream: widget.presenter.isLoadingStream,
                builder: (context, isLoadingSnapshot) {
                  return isLoadingSnapshot.data == true
                      ? Center(child: Text("Loading"))
                      : modelsSnapshot.data?.isNotEmpty == true
                          ? ListenableProvider(
                              create: (context) => widget.presenter,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: modelsSnapshot.data!.length,
                                  itemBuilder: ((context, index) =>
                                      ModelListCard(
                                          model: modelsSnapshot.data![index]))),
                            )
                          : NoData();
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "create-model",
          onPressed: () => Get.toNamed(Routes.createModel),
          icon: const Icon(FluentIcons.add_12_regular),
          label: const Text("Model"),
        ),
      );
    });
  }
}
