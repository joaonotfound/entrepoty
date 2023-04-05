import 'package:dropdown_search/dropdown_search.dart';
import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelCreationCategories extends StatefulWidget {
  ModelCreationCategories({Key? key}) : super(key: key);

  @override
  State<ModelCreationCategories> createState() =>
      _ModelCreationCategoriesState();
}

class _ModelCreationCategoriesState extends State<ModelCreationCategories> {
  List<String> _categories = [
    "Keyboard",
    "Mouse",
    "Headset",
    "Mousepad",
    "Charger",
    "Others"
  ];

  String? _value;

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelCreationPresenter>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownSearch(
        dropdownBuilder: (context, selectedItem) => Text(selectedItem ?? "Select one category"),
        onChanged: (value) => presenter.validateCategory(value ?? ''),
        items: [
          ..._categories.map(
            (e) => e,
          ),
        ],
      ),
    );
  }
}
