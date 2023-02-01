import 'package:flutter/material.dart';

class ProductModelField extends StatelessWidget {
  ProductModelField({
    Key? key,
  }) : super(key: key);

  final _modelos = ["modelo 1", "modelo 2", "modelo 3", "modelo 4", "modelo 5"];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text("Modelo"),
      items: _modelos
          .map((label) => DropdownMenuItem<String>(
                value: label,
                child: Text(label),
              ))
          .toList(),
      onChanged: (_) {},
    );
  }
}
