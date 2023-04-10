import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_borrow/domain/domain.dart';

class BorrowViewEmployer extends StatelessWidget {
  BorrowEntity borrow;

  BorrowViewEmployer({
    Key? key,
    required this.borrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Created by"),
      subtitle: Text(borrow.createdBy.username),
      leading: const CircleAvatar(
        child: Icon(FluentIcons.person_accounts_20_regular),
      ),
    );
  }
}
