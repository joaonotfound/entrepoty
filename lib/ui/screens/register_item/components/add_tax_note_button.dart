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
        backgroundColor: Color(0xffc92a2a),
      ),
      onPressed: () {},
      icon: Icon(
        Icons.upload,
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
