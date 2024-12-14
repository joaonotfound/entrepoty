import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class CustomerCreationSectorField extends StatelessWidget {
  const CustomerCreationSectorField({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<CustomerCreationPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.sectorErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validateSector,
            decoration: InputDecoration(
              hintText: 'Human Resources',
              labelText: 'Sector',
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              prefixIcon: const Icon(FluentIcons.organization_16_regular),
            ),
          );
        },);
  }
}
