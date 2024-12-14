import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../../../domain/domain.dart';

class BorrowListCard extends StatelessWidget {
  final BorrowEntity borrow;

  const BorrowListCard({
    required this.borrow, super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        Routes.getViewBorrow(borrow.id),
      ),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.surface,
        leading: const CircleAvatar(
          child: Icon(FluentIcons.person_12_regular),
        ),
        title: Text(borrow.product.name,
            style: Theme.of(context).textTheme.headlineSmall,),
        subtitle: Text(
          borrow.customer.name,
        ),
      ),
    );
  }
}
