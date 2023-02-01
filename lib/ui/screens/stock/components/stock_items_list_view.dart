import 'package:flutter/material.dart';

import '../stock_presenter.dart';

class StockItemsListView extends StatefulWidget {
  final StockPresenter presenter;
  const StockItemsListView({
    super.key,
    required this.presenter,
  });

  @override
  State<StockItemsListView> createState() => _StockItemsListViewState();
}

class _StockItemsListViewState extends State<StockItemsListView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.presenter.itemsStream,
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
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 40,
                                  color: Colors.grey[500],
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
