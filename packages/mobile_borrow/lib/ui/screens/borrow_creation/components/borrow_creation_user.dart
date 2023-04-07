import 'package:dropdown_search/dropdown_search.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class BorrowCreationUser extends StatelessWidget {
  BorrowCreationUser({super.key});

  final users = ['maria', 'asd', 'thomas'];
  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<BorrowCreationPresenter>(context);
    presenter.loadCustomers();

    return StreamBuilder<List<CustomerEntity>>(
      stream: presenter.customersStream,
      builder: (context, snapshot) => DropdownSearch<CustomerEntity>(
        filterFn: (item, filter) =>
            item.name.toLowerCase().contains(filter.toLowerCase()),
        dropdownBuilder: (context, selectedItem) =>
            Text(selectedItem?.name ?? "Select one user"),
        onChanged: (value) => presenter.validateCustomer(value!),
        popupProps: PopupProps.dialog(
            showSearchBox: true,
            isFilterOnline: true,
            searchDelay: Duration.zero,
            itemBuilder: (context, customer, isSelected) => ListTile(
                  leading: Icon(FluentIcons.person_12_regular),
                  title: Text(customer.name),
                ),
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(hintText: "Search user"),
            )),
        items: snapshot.data ?? [],
      ),
    );
  }
}
