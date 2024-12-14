import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ProductDetailTile extends StatelessWidget {
  ProductDetailEntity detail;

  ProductDetailTile({
    required this.detail, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      leading: const CircleAvatar(
        child: Icon(FluentIcons.box_16_regular),
      ),
      title: const Text('Equity'),
      subtitle: Text(detail.equity),
    );
  }
}
