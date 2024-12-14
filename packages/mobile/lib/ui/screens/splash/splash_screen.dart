import 'package:entrepoty/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';

class SplashScreen extends StatefulWidget {
  final SplashPresenter presenter;

  const SplashScreen({
    required this.presenter, super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with NavigationManager  {
  @override
  void initState() {
    handleNavigation(context, widget.presenter.navigateToStream);
    widget.presenter.checkAccount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 20,),
            Text(
              'Loading',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
