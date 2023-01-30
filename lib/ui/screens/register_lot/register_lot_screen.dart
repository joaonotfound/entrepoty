import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

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
      appBar: AppBar(
          title: Text("Registrar lot"),
          leading: IconButton(
            onPressed: () => Get.offNamed("/stock/create_item"),
            icon: Icon(Icons.close),
          )),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 35),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    AddTaxNoteButton(),
                    RegisterLotItemsListView(presenter: widget.presenter),
                  ],
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
