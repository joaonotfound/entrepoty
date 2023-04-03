import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BorrowCreationUser extends StatelessWidget {
  BorrowCreationUser({super.key});

  final users = ['maria', 'asd', 'thomas'];
  @override
  Widget build(BuildContext context) {
    return DropdownSearch(
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(hintText: "User"),
      ),
      popupProps: PopupProps.dialog(
          showSearchBox: true,
          isFilterOnline: true,
          searchDelay: Duration.zero,
          itemBuilder: (context, item, isSelected) => ListTile(
                leading: Icon(FluentIcons.person_12_regular),
                title: Text(item.toString()),
              ),
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(hintText: "Search user"),
          )),
      items: users,
    );
  }
}
