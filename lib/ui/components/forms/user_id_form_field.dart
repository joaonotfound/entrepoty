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
                filled: true,
                fillColor: Colors.white,
                hintText: "ma-00000-0",
                labelText: "Matrícula",
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data,
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: Theme.of(context).primaryColor,
                ),
                alignLabelWithHint: true),
          );
        });
  }
}
