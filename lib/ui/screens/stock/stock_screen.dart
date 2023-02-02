import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_desk_2/ui/ui.dart';
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: makeDrawer(context),
      appBar: AppBar(
        title: _searching ? StockSearchInput() : null,
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    _searching = !_searching;
                  }),
              icon: Icon(_searching ? Icons.close : Icons.search)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Estoque"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.folder_shared,
              ),
              label: "Empréstimos"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: "Usuários",
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StockListFilterChips(presenter: widget.presenter),
              StockItemsListView(
                presenter: widget.presenter,
              )
              // ignore: sized_box_for_whitespace
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed("/stock/create_lot/"),
        label: Text("Adicionar item"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
