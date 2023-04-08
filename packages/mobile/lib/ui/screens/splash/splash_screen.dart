import 'package:flutter/material.dart';

import 'package:entrepoty/ui/screens/splash/splash.dart';
import 'package:mobile_core/mobile_core.dart';

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
        return Loading();
      }),
    );
  }
}
