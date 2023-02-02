import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_desk_2/ui/screens/splash/splash.dart';

class SplashScreen extends StatelessWidget {
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
        presenter.navigateToStream.listen((page) {
          if (page?.isNotEmpty == true) {
            Get.offAllNamed(page!);
          }
        });
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text("Loading", style: TextStyle(color: Colors.white))
            ],
          ),
        );
      }),
    );
  }
}
