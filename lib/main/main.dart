import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:service_desk_2/main/factories/factories.dart';

import 'package:service_desk_2/ui/components/app_theme.dart';

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
      ],
    );
  }
}
