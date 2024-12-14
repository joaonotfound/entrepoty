import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/domain.dart';
import '../customer_list_screen_presenter.dart';

class CustomerListCard extends StatelessWidget {
  const CustomerListCard({
    super.key,
    required this.user,
  });

  final CustomerEntity user;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerListPresenter>(context);

    return InkWell(
      onTap: () => Get.toNamed(
        Routes.getViewCustomer(user.enrollment),
      ),
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.surface,
        dense: true,
        leading: SvgPicture.network(
          "https://source.boringavatars.com/beam",
        ),
        title: Text(
          user.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.organization_12_regular, size: 15),
            const SizedBox(width: 5),
            Text(user.sector),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: const ListTile(
                visualDensity: VisualDensity.compact,
                leading: Icon(FluentIcons.delete_12_regular),
                title: Text("Delete"),
              ),
              onTap: () => provider.deleteCustomer(user.enrollment),
            )
          ],
        ),
      ),
    );
  }
}
