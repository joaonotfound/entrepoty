import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ui.dart';
import 'components/components.dart';

class RegisterItemScreen extends StatefulWidget {
  final RegisterLotPresenter presenter;

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
                      RegisterLotItemsListView(),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    AddTaxNoteButton(),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Próximo"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
