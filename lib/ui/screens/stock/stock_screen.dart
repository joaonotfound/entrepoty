import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/components/appbar.dart';
import './components/components.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(context, "Estoque"),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(children: [
            const StockSearchInput(),
            // ignore: sized_box_for_whitespace
            Text("Não há items no stock!")
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
