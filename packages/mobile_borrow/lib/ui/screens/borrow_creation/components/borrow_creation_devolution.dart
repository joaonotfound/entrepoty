import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class BorrowCreationDevolution extends StatefulWidget {
  const BorrowCreationDevolution({super.key});

  @override
  State<BorrowCreationDevolution> createState() =>
      _BorrowCreationDevolutionState();
}

class _BorrowCreationDevolutionState extends State<BorrowCreationDevolution> {
  DateTime? _date;

  void _showDatePicker(
      BuildContext context, BorrowCreationPresenter presenter,) async {
    final response = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    );
    if (response != null) {
      setState(() {
        _date = response;
        presenter.validateDate(response);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<BorrowCreationPresenter>(context);
    return ElevatedButton.icon(
      icon: const Icon(Icons.today),
      style: ButtonStyle(
        alignment: Alignment.centerLeft,
        backgroundColor:
            WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
      ),
      label: Text(
        _date != null
            ? '${_date!.day}/${_date!.month}/${_date!.year}'
            : 'Select a date',
      ),
      onPressed: () => _showDatePicker(context, presenter),
    );
  }
}
