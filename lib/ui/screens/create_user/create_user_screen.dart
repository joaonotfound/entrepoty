import 'package:entrepoty/ui/components/components.dart';
import 'package:entrepoty/ui/layout/layout.dart';
import 'package:flutter/material.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    return FormLayout(
      content: Form(
        child: ListView(children: [
          UserNameField(),
          SizedBox(height: 10),
          UserEmailField(),
          SizedBox(height: 10),
          UserPermissionField()
        ]),
      ),
      action: ElevatedButton(
        child: Text("Criar usuário"),
        onPressed: () {},
      ),
      title: "Criar usuário",
    );
  }
}
