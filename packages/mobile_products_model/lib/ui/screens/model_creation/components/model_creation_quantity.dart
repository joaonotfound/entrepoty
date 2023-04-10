import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model_creation_presenter.dart';

class ModelCreationQuantities extends StatelessWidget {
  const ModelCreationQuantities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelCreationPresenter>(context);
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
