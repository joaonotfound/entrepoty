import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class EquityListTile extends StatelessWidget {
  ProductDetailEntity detail;

  EquityListTile({
    Key? key,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: const CircleAvatar(
        child: Icon(FluentIcons.box_16_regular),
      ),
      title: const Text("Equity"),
      subtitle: Text(detail.equity),
    );
  }
}
