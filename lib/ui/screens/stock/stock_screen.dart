import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:entrepoty/ui/ui.dart';
import './components/components.dart';

class StockScreen extends StatefulWidget {
  final StockPresenter presenter;
  const StockScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  bool _searching = false;

  @override
  Widget build(BuildContext context) {
    widget.presenter.loadScreen();
    return HomeLayout(
      appBar: makeAppbar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.createStockItem),
        icon: Icon(Icons.add),
        label: Text("Adicionar item"),
      ),
      body: ListenableProvider(
        create: (_) => widget.presenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StockListFilterChips(),
            StockItemsListView(),
          ],
        ),
      ),
    );
  }

  AppBar makeAppbar() {
    return AppBar(
      title: _searching ? StockSearchInput() : null,
      actions: [
        IconButton(
            onPressed: () => setState(() => _searching = !_searching),
            icon: Icon(_searching ? Icons.close : Icons.search)),
      ],
    );
  }
}
