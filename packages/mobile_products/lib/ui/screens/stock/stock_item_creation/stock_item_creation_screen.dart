
import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import '../stock.dart';
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
  void initState() {
    handleLoading(context, widget.presenter.isLoadingStream);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FormLayout(
      content: ListenableProvider(
        create: (_) => widget.presenter,
        child: Form(
          child: Column(
            children: [
              ProductModelField(),
              const SizedBox(height: 10),
              const ProductQuantityField(),
              const SizedBox(height: 10),
              const AddTaxNoteButton(),
            ],
          ),
        ),
      ),
      action: StreamBuilder(
          stream: widget.presenter.isFormValidStream,
          builder: (context, snapshot) {
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
