import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './factories/factories.dart';
import '../ui/ui.dart';

void startApp() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SD",
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: "/splash",
      getPages: [
        GetPage(name: '/splash', page: makeSplashScreen),
        GetPage(name: "/login", page: makeLoginScreen),
        GetPage(name: "/home", page: makeAppController),
        GetPage(name: "/stock/create_item", page: makeRegisterItemScreen),
      ],
    );
  }
}
