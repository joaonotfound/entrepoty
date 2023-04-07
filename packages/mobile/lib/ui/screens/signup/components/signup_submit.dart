import 'package:entrepoty/ui/ui.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupSubmit extends StatefulWidget {
  const SignupSubmit({super.key});

  @override
  State<SignupSubmit> createState() => _SignupSubmitState();
}

class _SignupSubmitState extends State<SignupSubmit> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupPresenter>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: StreamBuilder<bool>(
        stream: provider.isFormValidStream,
        builder: (context, snapshot) => ElevatedButton(
          onPressed: snapshot.data == true ? provider.signup : null,
          child: Text("Sign up", style: TextStyle(fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }
}
