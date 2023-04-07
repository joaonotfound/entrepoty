import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import './components/components.dart';
import 'stock_list_presenter.dart';

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
          icon: Icon(FluentIcons.add_12_regular),
          label: Text("Item"),
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
