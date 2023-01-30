import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

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
      initialRoute: "/login",
      getPages: [
        GetPage(name: "/login", page: makeLoginScreen),
        GetPage(
            name: "/stock", page: () => Scaffold(body: Text("Stock screen!")))
      ],
    );
  }
}
