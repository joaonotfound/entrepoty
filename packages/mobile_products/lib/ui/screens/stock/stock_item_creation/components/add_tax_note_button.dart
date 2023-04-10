import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AddTaxNoteButton extends StatelessWidget {
  const AddTaxNoteButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        minimumSize: const Size(double.infinity, 0),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: const Color(0xffc92a2a),
      ),
      onPressed: () {},
      icon: const Icon(
        FluentIcons.document_add_24_regular,
        color: Colors.white,
      ),
      label: const Text(
        "Add receipt",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
