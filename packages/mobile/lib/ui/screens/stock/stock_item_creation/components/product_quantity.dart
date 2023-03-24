import 'package:entrepoty/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductQuantityField extends StatelessWidget {
  const ProductQuantityField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<StockItemCreationPresenter>(context);
    return StreamBuilder(
        stream: presenter.qtdErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
              hintText: "Quantity",
              label: const Text("Quantity"),
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            onChanged: (value) =>
                presenter.validateQtd(int.tryParse(value) ?? 0),
            keyboardType: TextInputType.number,
          );
        });
  }
}
