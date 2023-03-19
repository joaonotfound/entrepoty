import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ui.dart';
import 'components/components.dart';

class RegisterItemScreen extends StatefulWidget {
  final RegisterItemPresenter presenter;

  const RegisterItemScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<RegisterItemScreen> createState() => _RegisterItemScreenState();
}

class _RegisterItemScreenState extends State<RegisterItemScreen> {
  @override
  Widget build(BuildContext context) {
    return FormLayout(
      content: ListenableProvider(
        create: (_) => widget.presenter,
        child: Form(
          child: Column(
            children: [
              ProductModelField(),
              SizedBox(height: 10),
              ProductQuantityField(),
              SizedBox(height: 10),
              AddTaxNoteButton(),
            ],
          ),
        ),
      ),
      action: StreamBuilder(
          stream: widget.presenter.isFormValidStream,
          builder: (context, snapshot) {
            return ElevatedButton(
              onPressed: snapshot.data == true ? () {} : null,
              child: Text("Próximo"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            );
          }),
      title: "Registrar Item",
    );
  }
}
