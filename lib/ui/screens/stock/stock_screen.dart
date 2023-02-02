import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    widget.presenter.loadScreen();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      child: ListenableProvider(
        create: (_) => widget.presenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StockListFilterChips(),
            StockItemsListView()
            // ignore: sized_box_for_whitespace
          ],
        ),
      ),
    );
  }
}
