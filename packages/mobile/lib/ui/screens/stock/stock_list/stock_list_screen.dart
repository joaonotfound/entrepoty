import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:entrepoty/ui/ui.dart';
import './components/components.dart';

class StockListScreen extends StatefulWidget {
  final StockListPresenter presenter;
  const StockListScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<StockListScreen> createState() => _StockListScreenState();
}

class _StockListScreenState extends State<StockListScreen> {
  bool _searching = false;

  @override
  void initState() {
    widget.presenter.loadScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: () => widget.presenter.loadScreen(),
      child: HomeLayout(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Get.toNamed(Routes.createStockItem),
          icon: Icon(Icons.add),
          label: Text("Create item"),
        ),
        body: ListenableProvider(
          create: (_) => widget.presenter,
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                StockListWelcomeMessage(),
                StockListSearchInput(),
                StockListFilterChips(),
                Expanded(
                  child: StockListItemsView(),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
