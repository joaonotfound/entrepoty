import 'package:entrepoty/ui/components/components.dart';
import 'package:entrepoty/ui/layout/layout.dart';
import 'package:entrepoty/ui/screens/user/user_creation/components/components.dart';
import 'package:flutter/material.dart';

class UserCreationScreen extends StatefulWidget {
  const UserCreationScreen({super.key});

  @override
  State<UserCreationScreen> createState() => _UserCreationScreenState();
}

class _UserCreationScreenState extends State<UserCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return FormLayout(
      content: Form(
        child: ListView(children: [
          UserNameField(),
          SizedBox(height: 10),
          UserEmailField(),
          SizedBox(height: 10),
          UserEnrollmentField(),
          SizedBox(height: 10),
          UserSectorField(),
        ]),
      ),
      action: ElevatedButton(
        child: Text("Create user"),
        onPressed: () {},
      ),
      title: "Create user",
    );
  }
}
