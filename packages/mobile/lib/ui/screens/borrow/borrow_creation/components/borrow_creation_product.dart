import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BorrowCreationProduct extends StatelessWidget {
  BorrowCreationProduct({super.key});

  final products = ["1", "2"];

  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(hintText: "Product"),
      ),
      popupProps: PopupProps.dialog(
          showSearchBox: true,
          isFilterOnline: true,
          searchDelay: Duration.zero,
          itemBuilder: (context, item, isSelected) => ListTile(
                leading: Icon(FluentIcons.storage_20_regular),
                title: Text(item.toString()),
              ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(hintText: "Search product"),
          )),
      items: products,
    );
  }
}
