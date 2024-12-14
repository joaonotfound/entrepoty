import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../ui/ui.dart';

class LoginSubmitButton extends StatelessWidget {
  const LoginSubmitButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<LoginPresenter>(context);
    return StreamBuilder<bool>(
        stream: presenter.isFormValidStream,
        builder: (context, snapshot) {
          return ElevatedButton(
            onPressed: snapshot.data == true ? presenter.authenticate : null,
            child: const Text('Login'),
          );
        },);
  }
}
