import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/ui.dart';

import 'components/components.dart';

class RegisterLotItemScreen extends StatelessWidget {
  const RegisterLotItemScreen({super.key});

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
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Adicionar"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Theme.of(context).primaryColor),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
