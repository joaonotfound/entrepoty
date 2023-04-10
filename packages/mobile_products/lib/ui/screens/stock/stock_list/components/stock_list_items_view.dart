import 'package:mobile_core/mobile_core.dart';

import './components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stock_list_presenter.dart';

class StockListItemsView extends StatefulWidget {
  const StockListItemsView({super.key});

  @override
  State<StockListItemsView> createState() => _StockListItemsViewState();
}

class _StockListItemsViewState extends State<StockListItemsView> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockListPresenter>(context);
    return StreamBuilder(
      stream: presenter.itemsStream,
      builder: ((context, snapshot) {
        if (snapshot.data?.isNotEmpty == true && snapshot.data != null) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => StockListItem(item: snapshot.data![index]),
                childCount: snapshot.data!.length),
          );
        } else {
          return const SliverToBoxAdapter(
            child: NoData(),
          );
        }
      }),
    );
  }
}
