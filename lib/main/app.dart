import 'package:entrepoty/main/factories/generate_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/ui.dart';

void startApp() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Entrepoty",
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: Routes.splash,
      getPages: [...generateRoutes()],
    );
  }
}
