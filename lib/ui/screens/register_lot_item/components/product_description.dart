import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_desk_2/ui/screens/register_lot/register_lot.dart';

class ProductDescriptionField extends StatelessWidget {
  const ProductDescriptionField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<RegisterLotPresenter>(context);
    return StreamBuilder(
        stream: presenter.descriptionErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration: InputDecoration(
                hintText: "Descrição do produto",
                label: const Text("Descrição"),
                errorText:
                    snapshot.data?.isEmpty == true ? null : snapshot.data),
            onChanged: presenter.validateDescription,
          );
        });
  }
}
