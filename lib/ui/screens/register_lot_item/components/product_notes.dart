import 'package:flutter/material.dart';

class ProductNotesField extends StatelessWidget {
  const ProductNotesField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Anotação ( opcional )",
        label: const Text("Anotações"),
      ),
      keyboardType: TextInputType.multiline,
    );
  }
}
