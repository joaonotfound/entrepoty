import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class CustomerListSearch extends StatelessWidget {
  const CustomerListSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(FluentIcons.search_16_regular),
        onPressed: () {},
    );
  }
}
