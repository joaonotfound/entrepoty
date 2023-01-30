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
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ListView.separated(
                  separatorBuilder: ((context, index) => SizedBox(
                        height: 20,
                      )),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {},
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                spreadRadius: 0.8,
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                              )
                            ]),
                            child: FittedBox(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      snapshot.data![index].imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      child: Text(
                                        snapshot.data![index].description,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    )
                                  ]),
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
