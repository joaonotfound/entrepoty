import 'package:dropdown_search/dropdown_search.dart';
import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/screens/borrow/borrow_creation/borrow_creation_presenter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BorrowCreationProduct extends StatelessWidget {
  BorrowCreationProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<BorrowCreationPresenter>(context);
    presenter.loadProducts();
    return StreamBuilder<List<ProductEntity>>(
      stream: presenter.productsStream,
      builder: (context, snapshot) => DropdownSearch<ProductEntity>(
        dropdownBuilder: (context, selectedItem) =>
            Text(selectedItem?.model.name ?? "Select one product"),
        filterFn: (item, filter) =>
            item.model.name.toLowerCase().contains(filter.toLowerCase()),
        onChanged: (value) => presenter.validateProduct(value!),
        popupProps: PopupProps.dialog(
            showSearchBox: true,
            isFilterOnline: true,
            searchDelay: Duration.zero,
            itemBuilder: (context, item, isSelected) => ListTile(
                  leading: Icon(FluentIcons.storage_20_regular),
                  title: Text(item.model.name),
                ),
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(hintText: "Search product"),
            )),
        items: snapshot.data ?? [],
      ),
    );
  }
}
