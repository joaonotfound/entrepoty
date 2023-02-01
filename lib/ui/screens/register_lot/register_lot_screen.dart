import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ui.dart';
import 'components/components.dart';

class RegisterLotScreen extends StatefulWidget {
  final RegisterLotPresenter presenter;

  const RegisterLotScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<RegisterLotScreen> createState() => _RegisterLotScreenState();
}

class _RegisterLotScreenState extends State<RegisterLotScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeFormAppbar("Registrar lot"),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 35),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: ListenableProvider(
                  create: (_) => widget.presenter,
                  child: Column(
                    children: [
                      AddTaxNoteButton(),
                      RegisterLotItemsListView(),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Próximo"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
