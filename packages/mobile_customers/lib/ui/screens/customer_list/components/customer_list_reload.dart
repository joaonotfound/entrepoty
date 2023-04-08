import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_customers/mobile_customers.dart';

class CustomerListReload extends StatefulWidget {
  const CustomerListReload({Key? key}) : super(key: key);

  @override
  State<CustomerListReload> createState() => _CustomerListReloadState();
}

class _CustomerListReloadState extends State<CustomerListReload> {

  @override
  Widget build(BuildContext context) {
    final presenter = Get.find<CustomerListPresenter>();
    return IconButton(
      icon: const Icon(FluentIcons.arrow_clockwise_16_regular),
      onPressed: () => presenter.loadCustomers(),
    );
  }
}
