import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui.dart';

class CustomerCreationEnrollmentField extends StatelessWidget {
  const CustomerCreationEnrollmentField({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<CustomerCreationPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.enrollmentErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validateEnrollment,
            decoration: InputDecoration(
              hintText: "Enrollments's id",
              labelText: "Enrollment",
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              prefixIcon: const Icon(FluentIcons.person_accounts_24_regular),
            ),
          );
        });
  }
}
