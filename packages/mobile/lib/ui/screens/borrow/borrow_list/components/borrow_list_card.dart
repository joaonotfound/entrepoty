import 'package:entrepoty/domain/domain.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BorrowListCard extends StatelessWidget {
  BorrowEntity borrow;
  BorrowListCard({
    super.key,
    required this.borrow,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.surface,
      leading: Icon(FluentIcons.person_12_regular),
      title: Text(
        borrow.customer.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: Text(
        borrow.product.model.name,
      ),
    );
  }
}
