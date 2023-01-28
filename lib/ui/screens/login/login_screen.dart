import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/ui.dart';

import './components/login_appbar_component.dart';
import './components/login_submit_button.dart';

class LoginScreen extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EBF3),
      appBar: getLoginAppbarComponent(),
      body: Builder(builder: (context) {
        widget.presenter.isLoadingStream.listen((isLoading) {
          if (isLoading == true) {
            showLoading(context);
          } else {
            hideLoading(context);
          }
        });

        widget.presenter.mainErrorStream
            ?.listen((error) => showErrorMessage(context, error));

        return Padding(
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
                      UserIdFormField(loginPresenter: widget.presenter),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 30),
                        child: UserPasswordField(
                          loginPresenter: widget.presenter,
                        ),
                      ),
                      getLoginSubmitButton(widget.presenter)
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
