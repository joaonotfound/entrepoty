import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_products/mobile_products.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class BorrowCreationProduct extends StatelessWidget {
  const BorrowCreationProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<BorrowCreationPresenter>(context);
    presenter.loadProducts();
    return StreamBuilder<List<ProductDetailWithProduct>>(
      stream: presenter.productsStream,
      builder: (context, snapshot) => DropdownSearch<ProductDetailWithProduct>(
        dropdownBuilder: (context, selectedItem) =>
            Text(selectedItem?.equity ?? 'Select one product'),
        filterFn: (item, filter) =>
            item.product.name.toLowerCase().contains(filter.toLowerCase()),
        onChanged: (value) => presenter.validateProduct(value!),
        popupProps: PopupProps.dialog(
            showSearchBox: true,
            isFilterOnline: true,
            searchDelay: Duration.zero,
            itemBuilder: (context, item, isSelected) => ListTile(
                  leading: const Icon(FluentIcons.storage_20_regular),
                  title: Text(item.product.name),
                  subtitle: Text(item.equity),
                ),
            searchFieldProps: const TextFieldProps(
              decoration: InputDecoration(hintText: 'Search product'),
            ),),
        items: snapshot.data ?? [],
      ),
    );
  }
}
