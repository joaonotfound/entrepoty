import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/ui.dart';

class LoginScreen extends StatelessWidget {
  final LoginPresenter presenter;
  const LoginScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EBF3),
      appBar: AppBar(
        flexibleSpace: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Image(
            image: AssetImage("lib/ui/assets/logo_light.png"),
            fit: BoxFit.contain,
          ),
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 10,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 40,
              child: Center(
                child: Icon(
                  Icons.account_circle_sharp,
                  size: MediaQuery.of(context).size.height * 0.15,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            Expanded(
              flex: 60,
              child: Form(
                child: Column(
                  children: [
                    UserIdFormField(loginPresenter: presenter),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 30),
                      child: UserPasswordField(
                        loginPresenter: presenter,
                      ),
                    ),
                    StreamBuilder<bool>(
                        stream: presenter.isFormValidStream,
                        builder: (context, snapshot) {
                          return ElevatedButton(
                            onPressed: snapshot.data == true
                                ? presenter.authenticate
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              minimumSize: const Size(double.infinity, 50),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            child: const Text("Entrar"),
                          );
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
