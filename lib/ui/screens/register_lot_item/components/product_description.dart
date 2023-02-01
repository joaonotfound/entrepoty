import 'package:flutter/material.dart';

class ProductDescriptionField extends StatelessWidget {
  const ProductDescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Descrição do produto",
        label: const Text("Descrição"),
      ),
    );
  }
}
