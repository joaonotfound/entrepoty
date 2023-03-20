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
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index].description,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].model,
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))),
            );
          } else {
            return Center(
                child: Text(
                    "Não há items no estoque! ${snapshot.data.toString()}"));
          }
        }));
  }
}
