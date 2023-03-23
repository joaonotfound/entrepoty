import 'package:entrepoty/ui/screens/stock/stock_item_creation/stock_item_creation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductModelField extends StatelessWidget {
  ProductModelField({
    Key? key,
  }) : super(key: key);

  final _modelos = ["modelo 1", "modelo 2", "modelo 3", "modelo 4", "modelo 5"];

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockItemCreationPresenter>(context);
    return DropdownButtonFormField(
      hint: Text("Modelo"),
      items: _modelos
          .map((label) => DropdownMenuItem<String>(
                value: label,
                child: Text(label),
              ))
          .toList(),
      onChanged: (value) => presenter.validateModel(value ?? ''),
    );
  }
}
