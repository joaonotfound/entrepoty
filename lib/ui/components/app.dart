import 'dart:async';

import 'package:flutter/material.dart';
import 'package:service_desk_2/ui/screens/screens.dart';
// ignore: depend_on_referenced_packages

class StreamLoginPresenter extends LoginPresenter {
  final _idErrorController = StreamController<String>.broadcast();
  final _passwordErrorController = StreamController<String>.broadcast();
  final _isFormValidController = StreamController<bool>.broadcast();
  final _isLoadingController = StreamController<bool>.broadcast();
  final _mainErrorController = StreamController<String>.broadcast();
  @override
  Stream<String> get idErrorStream => _idErrorController.stream;

  @override
  Stream<String> get passwordErrorStream => _passwordErrorController.stream;

  @override
  Stream<bool> get isFormValidStream => _isFormValidController.stream;

  @override
  Stream<bool> get isLoadingStream => _isLoadingController.stream;
  @override
  Stream<String> get mainErrorStream => _mainErrorController.stream;

  @override
  void validateId(String id) {}

  @override
  void validatePassword(String password) {}

  @override
  void authenticate() {
    _isLoadingController.add(true);
  }

  @override
  void dispose() {}
}

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
