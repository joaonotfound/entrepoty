import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_desk_2/ui/ui.dart';

import 'components/components.dart';

class RegisterLotItemScreen extends StatelessWidget {
  final RegisterLotPresenter presenter;
  const RegisterLotItemScreen({
    super.key,
    required this.presenter,
  });

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: makeFormAppbar("Registrar item"),
        body: SafeArea(
          child: Container(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListenableProvider(
                      create: (_) => presenter,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(bottom: 20, left: 2),
                            child: Text(
                              "Adicionar item",
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          ProductDescriptionField(),
                          SizedBox(height: 10),
                          ProductQuantityField(),
                          SizedBox(height: 10),
                          ProductModelField(),
                          SizedBox(height: 10),
                          ProductNotesField(),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: StreamBuilder(
                        stream: presenter.isFormValidStream,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                            onPressed: snapshot.data == true
                                ? presenter.saveItem
                                : null,
                            child: Text("Adicionar"),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                backgroundColor:
                                    Theme.of(context).primaryColor),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
