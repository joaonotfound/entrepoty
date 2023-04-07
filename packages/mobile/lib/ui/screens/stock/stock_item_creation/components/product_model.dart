import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/screens/stock/stock_item_creation/stock_item_creation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_products_model/mobile_products_model.dart';
import 'package:provider/provider.dart';

class ProductModelField extends StatelessWidget {
  ProductModelField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockItemCreationPresenter>(context);
    presenter.loadModels();
    return StreamBuilder<List<ProductModelEntity>>(
        stream: presenter.modelsStream,
        builder: (context, snapshot) {
          debugPrint(snapshot.data.toString());
          return DropdownButtonFormField<int>(
            hint: Text("Model"),
            items: snapshot.data == null
                ? []
                : snapshot.data!
                    .map((model) => DropdownMenuItem<int>(
                          value: model.id,
                          child: Text(model.name),
                        ))
                    .toList(),
            onChanged: (value) => presenter.validateModel(value ?? 0),
          );
        });
  }
}
