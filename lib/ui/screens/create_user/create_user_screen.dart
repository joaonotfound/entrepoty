import 'package:entrepoty/ui/components/components.dart';
import 'package:entrepoty/ui/factories/factories.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeFormAppbar("Criar usuário"),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 35),
        child: Column(children: [
          Expanded(
            child: Form(
              child: ListView(children: [
                // UserIdFormField(),
                UserNameField(),
                SizedBox(height: 10),
                UserEmailField(),
                SizedBox(height: 10),
                UserPermissionField()
              ]),
            ),
            flex: 1,
          ),
          Align(
            child: ElevatedButton(
              child: Text("Criar usuário"),
              onPressed: () {},
            ),
          )
        ]),
      )),
    );
  }
}
