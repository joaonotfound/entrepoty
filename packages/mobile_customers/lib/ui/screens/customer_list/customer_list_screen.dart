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

class _CustomerListScreenState extends State<CustomerListScreen>
    with UiErrorManager {
  @override
  void initState() {
    handleUiError(context, widget.presenter.mainErrorStream);
    widget.presenter.loadCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put<CustomerListPresenter>(widget.presenter);
    return HomeLayout(
      appBar: AppBar(
        actions:  [
        IconButton(
          icon: const Icon(FluentIcons.arrow_clockwise_16_regular),
          onPressed: () {
            debugPrint("reloading...");
            widget.presenter.loadCustomers();
          },
        ),
        const CustomerListSearch()
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
                    ? const Loading()
                    : customersSnapshot.data?.isNotEmpty == true
                        ? ListenableProvider(
                            create: (context) => widget.presenter,
                            child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: customersSnapshot.data!.length,
                              itemBuilder: ((context, index) =>
                                  CustomerListCard(
                                    user: customersSnapshot.data![index],
                                  )),
                            ),
                          )
                        : const Center(child: NoData());
              },
            );
          },
        ),
      ),
      floatingActionButton: const CustomerListFloatingActionButton()
    );
  }
}
