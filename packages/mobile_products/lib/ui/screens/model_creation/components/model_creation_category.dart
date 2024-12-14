import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import '../model_creation_presenter.dart';

class ModelCreationCategories extends StatefulWidget {
  const ModelCreationCategories({Key? key}) : super(key: key);

  @override
  State<ModelCreationCategories> createState() =>
      _ModelCreationCategoriesState();
}

class _ModelCreationCategoriesState extends State<ModelCreationCategories> {
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<ModelCreationPresenter>(context);
    final categoryProvider = Get.find<CategoriesProvider>();
    final categories = categoryProvider.loadCategories();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: DropdownSearch(
        dropdownBuilder: (context, selectedItem) =>
            Text(selectedItem ?? "Select one category"),
        onChanged: (value) => presenter.validateCategory(value ?? ''),
        items: [
          ...categories.map(
            (e) => e,
          ),
        ],
      ),
    );
  }
}
