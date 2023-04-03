import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomerListScreen extends StatelessWidget with UiErrorManager {
  const CustomerListScreen({
    super.key,
    required this.presenter,
  });
  final CustomerListPresenter presenter;
  @override
  Widget build(BuildContext context) {
    presenter.loadCustomers();
    return Builder(builder: (context) {
      handleUiError(context, presenter.mainErrorStream);
      return HomeLayout(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => presenter.loadCustomers(),
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
          onRefresh: () => presenter.loadCustomers(),
          child: StreamBuilder(
            stream: presenter.customersStream,
            builder: (context, customersSnapshot) {
              return StreamBuilder(
                stream: presenter.isLoadingStream,
                builder: (context, isLoadingSnapshot) {
                  return isLoadingSnapshot.data == true
                      ? Center(child: Text("Loading"))
                      : customersSnapshot.data?.isNotEmpty == true
                          ? ListenableProvider(
                              create: (context) => presenter,
                              child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 10),
                                  itemCount: customersSnapshot.data!.length,
                                  itemBuilder: ((context, index) =>
                                      CustomerListCard(
                                          user:
                                              customersSnapshot.data![index]))),
                            )
                          : const Center(
                              child: Text("Couldn't find any customer"));
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "add-user",
          onPressed: () => Get.toNamed(Routes.createCustomer),
          icon: const Icon(Icons.add),
          label: const Text("Customer"),
        ),
      );
    });
  }
}
