import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import '../../ui.dart';

class CustomerListScreen extends StatefulWidget {
  final CustomerListPresenter presenter;

  const CustomerListScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<CustomerListScreen> createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> with UiErrorManager {
  @override
  void initState() {
    widget.presenter.loadCustomers();
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
              onPressed: () => widget.presenter.loadCustomers(),
            ),
            IconButton(
              icon: const Icon(FluentIcons.search_16_regular),
              onPressed: () {} // => Get.to(
                //const SearchScreen(),
                // transition: Transition.rightToLeft,
              //),
            )
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () => widget.presenter.loadCustomers(),
          child: StreamBuilder(
            stream: widget.presenter.customersStream,
            builder: (context, customersSnapshot) {
              return StreamBuilder(
                stream: widget.presenter.isLoadingStream,
                builder: (context, isLoadingSnapshot) {
                  return isLoadingSnapshot.data == true
                      ? Center(child: Text("Loading"))
                      : customersSnapshot.data?.isNotEmpty == true
                          ? ListenableProvider(
                              create: (context) => widget.presenter,
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
                              child: NoData());
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "add-user",
          onPressed: () => Get.toNamed(Routes.createCustomer),
          icon: const Icon(FluentIcons.add_12_regular),
          label: const Text("Customer"),
        ),
      );
    });
  }
}
