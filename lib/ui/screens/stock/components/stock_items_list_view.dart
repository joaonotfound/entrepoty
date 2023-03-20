import './components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stock_presenter.dart';

class StockItemsListView extends StatefulWidget {
  const StockItemsListView({super.key});

  @override
  State<StockItemsListView> createState() => _StockItemsListViewState();
}

class _StockItemsListViewState extends State<StockItemsListView> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockPresenter>(context);
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
                    StockItem(item: snapshot.data![index]))),
          );
        } else {
          return Center(
              child:
                  Text("Não há items no estoque! ${snapshot.data.toString()}"));
        }
      }),
    );
  }
}
