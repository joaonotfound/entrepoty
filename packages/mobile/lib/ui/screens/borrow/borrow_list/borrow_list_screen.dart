import 'package:entrepoty/ui/components/components.dart';
import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/screens/borrow/borrow_list/components/components.dart';
import 'package:entrepoty/ui/screens/screens.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../misc/misc.dart';

class BorrowListScreen extends StatefulWidget {
  final BorrowListPresenter presenter;
  BorrowListScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<BorrowListScreen> createState() => _BorrowListScreenState();
}

class _BorrowListScreenState extends State<BorrowListScreen> {
  @override
  void initState() {
    widget.presenter.loadBorrows();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      body: RefreshIndicator(
        onRefresh: () => widget.presenter.loadBorrows(),
        child: StreamBuilder(
          stream: widget.presenter.borrowsStream,
          builder: (context, borrowsSnapshot) {
            print(borrowsSnapshot);
            return StreamBuilder(
              stream: widget.presenter.isLoadingStream,
              builder: (context, isLoadingSnapshot) {
                return isLoadingSnapshot.data == true
                    ? Center(child: Text("Loading"))
                    : borrowsSnapshot.data?.isNotEmpty == true
                        ? ListenableProvider(
                            create: (context) => widget.presenter,
                            child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                itemCount: borrowsSnapshot.data!.length,
                                itemBuilder: ((context, index) =>
                                    BorrowListCard(
                                        borrow: borrowsSnapshot.data![index]))),
                          )
                        : NoData();
              },
            );
          },
        ),
      ),
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () => widget.presenter.loadBorrows(),
          icon: Icon(FluentIcons.arrow_clockwise_16_regular),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "create-borrow",
        onPressed: () => Get.toNamed(Routes.createBorrow),
        icon: const Icon(FluentIcons.add_12_regular),
        label: const Text("Borrow"),
      ),
    );
  }
}
