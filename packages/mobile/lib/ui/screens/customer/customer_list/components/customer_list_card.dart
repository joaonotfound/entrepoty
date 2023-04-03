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
      child: Card(
        margin: EdgeInsets.only(),
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.network(
                "https://source.boringavatars.com/beam",
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              SizedBox(width: 15),
              Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(minHeight: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(width: 10),
                          Text("@${user.enrollment}",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FluentIcons.organization_12_regular, size: 15),
                          SizedBox(width: 5),
                          Text(user.sector),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              PopupMenuButton(
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(FluentIcons.delete_12_regular),
                            title: Text("Delete"),
                          ),
                          onTap: () => provider.deleteCustomer(user.enrollment),
                        )
                      ])
            ],
          ),
        ),
      ),
    );
  }
}
