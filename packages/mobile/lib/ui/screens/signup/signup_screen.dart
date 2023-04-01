import 'package:entrepoty/ui/screens/signup/components/components.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 10,
              ),
              child: Form(
                child: ListView(children: [
                  SignupWelcomeMessage(),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(FluentIcons.person_12_regular),
                      hintText: "Your full name",
                      label: Text("Name"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(FluentIcons.person_accounts_20_regular),
                        hintText: "Username",
                        label: Text("Username"),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FluentIcons.lock_closed_12_regular),
                      hintText: "Your most secure password",
                      label: Text("Password"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Sign up"),
                    ),
                  )
                ]),
              ),
            );
          },
        ));
  }
}
