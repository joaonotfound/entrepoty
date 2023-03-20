import 'package:entrepoty/main/factories/generate_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../ui/ui.dart';

void startApp() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ThemeProvider(),
      builder: (context, child) {
        ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

        return StreamBuilder(
          stream: themeProvider.isDark.stream,
          builder: (context, snapshot) => GetMaterialApp(
            title: "Entrepoty",
            debugShowCheckedModeBanner: false,
            theme: makeLightTheme(),
            darkTheme: makeDarkTheme(),
            themeMode:
                themeProvider.isDark.value ? ThemeMode.dark : ThemeMode.light,
            initialRoute: Routes.splash,
            getPages: [...generateRoutes()],
          ),
        );
      },
    );
  }
}
