import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:service_desk_2/main/factories/pages/stock/stock.dart';

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
        GetPage(name: "/stock", page: makeStockScreen),
        GetPage(name: "/stock/create_item", page: makeRegisterItemScreen),
      ],
    );
  }
}
