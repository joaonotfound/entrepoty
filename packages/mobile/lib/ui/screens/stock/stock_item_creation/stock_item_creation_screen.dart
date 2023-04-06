import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';

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

class _StockItemCreationScreenState extends State<StockItemCreationScreen>
    with LoadingManager {
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
            handleLoading(context, widget.presenter.isLoadingStream);
            return ElevatedButton(
              onPressed: snapshot.data == true
                  ? () => widget.presenter.saveItem()
                  : null,
              child: Text("Create"),
            );
          }),
      title: "Create item",
    );
  }
}
