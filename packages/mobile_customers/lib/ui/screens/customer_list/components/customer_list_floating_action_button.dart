import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

class CustomerListFloatingActionButton extends StatefulWidget {
  const CustomerListFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<CustomerListFloatingActionButton> createState() =>
      _CustomerListFloatingActionButtonState();
}

class _CustomerListFloatingActionButtonState
    extends State<CustomerListFloatingActionButton> {
  @override
  Widget build(BuildContext context) {

    return FloatingActionButton.extended(
      heroTag: 'add-user',
      onPressed: () => Get.toNamed(Routes.createCustomer),
      icon: const Icon(FluentIcons.add_12_regular),
      label: const Text('Customer'),
    );
  }
}
