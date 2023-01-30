import 'package:flutter/material.dart';

class AddTaxNoteButton extends StatelessWidget {
  const AddTaxNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: Size(double.infinity, 0),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      onPressed: () {},
      icon: Icon(
        Icons.picture_as_pdf,
        color: Colors.white,
      ),
      label: Text(
        "Adicionar nota fiscal",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
