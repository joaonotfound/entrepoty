import 'package:flutter/material.dart';

import 'package:entrepoty/ui/mixins/mixins.dart';
import 'package:entrepoty/ui/screens/splash/splash.dart';

class SplashScreen extends StatelessWidget with NavigationManager {
  final SplashPresenter presenter;
  const SplashScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    presenter.checkAccount();
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Builder(builder: (context) {
        handleNavigation(context, presenter.navigateToStream);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Colors.white),
              SizedBox(height: 20),
              Text("Loading", style: TextStyle(color: Colors.white))
            ],
          ),
        );
      }),
    );
  }
}
