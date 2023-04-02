import 'package:entrepoty/presentation/presentation.dart';
import 'package:get/get.dart';
import '../../ui/ui.dart';
import 'factories.dart';

List<GetPage> generateRoutes() {
  return [
    GetPage(name: Routes.launch, page: () => LaunchScreen()),
    GetPage(name: Routes.splash, page: makeSplashScreen),
    GetPage(
      name: Routes.login,
      page: makeLoginScreen,
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.signup,
      page: () => makeSignupScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(name: Routes.home, page: makeAppController),
    GetPage(
      name: Routes.createUser,
      page: () => CustomerCreationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(name: Routes.settings, page: () => makeSettingsScreen()),
    GetPage(
      name: Routes.createModel,
      page: () => ModelCreationScreen(
        presenter: MockedModelCreationPresenter(),
      ),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.createStockItem,
      page: makeStockItemCreationScreen,
      transition: Transition.rightToLeft,
    ),
  ];
}
