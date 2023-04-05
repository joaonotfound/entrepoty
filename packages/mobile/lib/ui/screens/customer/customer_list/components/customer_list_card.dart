import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/domain.dart';

class CustomerListCard extends StatelessWidget {
  CustomerListCard({
    super.key,
    required this.user,
  });
  final CustomerEntity user;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CustomerListPresenter>(context);

    return InkWell(
      child: ListTile(
        tileColor: Theme.of(context).colorScheme.surface,
        dense: true,
        leading: SvgPicture.network(
          "https://source.boringavatars.com/beam",
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              user.name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(width: 10),
            Text("@${user.enrollment}",
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FluentIcons.organization_12_regular, size: 15),
            SizedBox(width: 5),
            Text(user.sector),
          ],
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: ListTile(
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
