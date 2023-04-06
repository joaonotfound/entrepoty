import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomerListScreen extends StatefulWidget {
  const CustomerListScreen({
    super.key,
    required this.presenter,
  });
  final CustomerListPresenter presenter;

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
              icon: const Icon(Icons.refresh),
              onPressed: () => widget.presenter.loadCustomers(),
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
                              child: Text("No customers found"));
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
