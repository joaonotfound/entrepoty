import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<String> loadCategories(){
    return [
      "Keyboard",
      "Mouse",
      "Headset",
      "Mousepad",
      "Charger",
      "Others"
    ];
  }
}
