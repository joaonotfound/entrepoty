import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../stock_list_presenter.dart';
import 'stock_filter_chip.dart';

class StockListFilterChips extends StatelessWidget {
  const StockListFilterChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockListPresenter>(context);
    return StreamBuilder(
      stream: presenter.categoriesStream,
      builder: ((context, snapshot) {
        if (snapshot.data?.isNotEmpty == true && snapshot.data != null) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            height: 30,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: ((context, index) => SizedBox(
                      width: 5,
                    )),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>
                    StockFilterChip(text: snapshot.data![index].name)),
          );
        }
        return Text("Sem categorias!");
      }),
    );
  }
}
