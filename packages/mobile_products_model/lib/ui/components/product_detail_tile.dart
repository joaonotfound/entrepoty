import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_products/domain/domain.dart';

class ProductDetailTile extends StatelessWidget {
  ProductDetailEntity detail;

  ProductDetailTile({
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
