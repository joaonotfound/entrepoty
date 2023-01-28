import 'package:flutter/material.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/ui/screens/screens.dart';
import 'package:mocktail/mocktail.dart';

class MockValidator extends Mock implements Validation {}

LoginPresenter makeLoginPresenter() {
  return StreamLoginPresenter(validator: MockValidator());
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
