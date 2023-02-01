import 'package:flutter/material.dart';

class ProductQuantityField extends StatelessWidget {
  const ProductQuantityField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Quantidade",
        label: const Text("Quantidade"),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
