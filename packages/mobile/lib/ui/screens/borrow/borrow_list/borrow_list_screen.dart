import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/screens/borrow/borrow_list/components/components.dart';
import 'package:entrepoty/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../misc/misc.dart';

class BorrowListScreen extends StatefulWidget {
  BorrowListPresenter presenter;
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
                        : const Center(child: Text("No borrow found"));
              },
            );
          },
        ),
      ),
      appBar: AppBar(actions: [
        IconButton(
          onPressed: () => widget.presenter.loadBorrows(),
          icon: Icon(Icons.refresh),
        )
      ]),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "create-borrow",
        onPressed: () => Get.toNamed(Routes.createBorrow),
        icon: const Icon(Icons.add),
        label: const Text("Borrow"),
      ),
    );
  }
}
