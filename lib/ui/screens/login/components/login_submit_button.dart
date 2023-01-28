import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

StreamBuilder<bool> getLoginSubmitButton(LoginPresenter presenter) {
  return StreamBuilder<bool>(
      stream: presenter.isFormValidStream,
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: snapshot.data == true ? presenter.authenticate : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            minimumSize: const Size(double.infinity, 50),
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          child: const Text("Entrar"),
        );
      });
}
