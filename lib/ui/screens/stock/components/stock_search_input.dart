import 'package:flutter/material.dart';

class StockSearchInput extends StatelessWidget {
  const StockSearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Procurar por item",
        enabledBorder: defaultOutlineBorder(),
        focusedBorder: defaultOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder defaultOutlineBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(
      color: Colors.transparent,
    ));
  }
}
