import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../ui/ui.dart';

class UserIdFormField extends StatelessWidget {
  const UserIdFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<String?>(
        stream: presenter.idErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            onChanged: presenter.validateId,
            decoration: InputDecoration(
              hintText: "ma-00000-0",
              labelText: "Your id",
              errorText: snapshot.data?.isEmpty == true ? null : snapshot.data,
              prefixIcon: Icon(FluentIcons.person_12_regular
                  // color: Colors.black54,
                  ),
            ),
          );
        });
  }
}
