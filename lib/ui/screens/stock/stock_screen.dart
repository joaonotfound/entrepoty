import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/components/appbar.dart';
import 'package:service_desk_2/ui/screens/screens.dart';
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
  @override
  Widget build(BuildContext context) {
    widget.presenter.loadScreen();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: getAppbar(context, "Estoque"),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(children: [
            const StockSearchInput(),
            StockListFilterChips(presenter: widget.presenter),
            StockItemsListView(
              presenter: widget.presenter,
            )
            // ignore: sized_box_for_whitespace
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
