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
      child: SafeArea(
        child: HomeLayout(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(FluentIcons.arrow_clockwise_16_regular),
                onPressed: () => widget.presenter.loadScreen(),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FluentIcons.search_20_regular),
              ),
              IconButton(
                  icon: const Icon(FluentIcons.settings_20_regular),
                  onPressed: () => Get.toNamed(Routes.settings))
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () => Get.toNamed(Routes.createStockItem),
            icon: const Icon(FluentIcons.add_12_regular),
            label: const Text("Item"),
          ),
          body: ListenableProvider(
            create: (_) => widget.presenter,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: const [
                      StockListFilterChips(),
                    ],
                  ),
                ),
                const StockListItemsView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
