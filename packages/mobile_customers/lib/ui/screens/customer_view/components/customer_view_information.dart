import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customers/domain/domain.dart';

class CustomerViewInformation extends StatelessWidget {
  CustomerEntity customer;

  CustomerViewInformation({
    required this.customer, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading:
              const CircleAvatar(child: Icon(FluentIcons.person_20_regular)),
          title: const Text('Name'),
          subtitle: Text(customer.name),
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(
              FluentIcons.organization_20_regular,
            ),
          ),
          title: const Text('Enrollment'),
          subtitle: Text(customer.enrollment),
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(FluentIcons.mail_20_regular),
          ),
          title: const Text('E-mail'),
          subtitle: Text(customer.email),
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(FluentIcons.organization_20_regular),
          ),
          title: const Text('Sector'),
          subtitle: Text(customer.sector),
        ),
      ],
    );
  }
}
