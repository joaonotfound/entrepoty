import 'package:flutter/material.dart';
import 'package:service_desk_2/presentation/presenters/stream_login_presenter.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter();
}

class App extends StatelessWidget {
  final primaryColor = const Color(0xFF414BB2);
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SD",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: primaryColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: SafeArea(
        child: LoginScreen(
          presenter: makeLoginPresenter(),
        ),
      ),
    );
  }
}
