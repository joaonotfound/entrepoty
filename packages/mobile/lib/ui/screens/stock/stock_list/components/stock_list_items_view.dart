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
          return Container(
            height: 600,
            child: ListView.separated(
                separatorBuilder: ((context, index) => SizedBox(
                      height: 10,
                    )),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) =>
                    StockListItem(item: snapshot.data![index]))),
          );
        } else {
          return Expanded(
            flex: 1,
            child: Center(child: Text("There's no product on stock")),
          );
        }
      }),
    );
  }
}
