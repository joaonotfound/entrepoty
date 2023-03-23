import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';
import './stock_item_creation_presenter.dart';

class StockItemCreationScreen extends StatefulWidget {
  final StockItemCreationPresenter presenter;

  const StockItemCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<StockItemCreationScreen> createState() =>
      _StockItemCreationScreenState();
}

class _StockItemCreationScreenState extends State<StockItemCreationScreen> {
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
