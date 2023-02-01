import 'package:flutter/material.dart';

class StockSearchInput extends StatelessWidget {
  const StockSearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        fillColor: Colors.grey[200],
        hintText: "Procurar por item",
        enabledBorder: defaultOutlineBorder(),
        focusedBorder: defaultOutlineBorder(),
      ),
    );
  }

  OutlineInputBorder defaultOutlineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          color: Colors.transparent,
        ));
  }
}
