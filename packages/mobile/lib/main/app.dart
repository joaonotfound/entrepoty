import 'package:entrepoty/infra/backend/backend.dart';
import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/getx_theme_presenter.dart';
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
    return MultiProvider(
      providers: [
        Provider(
            create: (context) => ThemeProvider(
                presenter: GetxThemePresenter(theme: makeLocalTheme()))),
        Provider(
          create: (context) =>
              BackendProvider(presenter: ImplBackendPresenter()),
        )
      ],
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
