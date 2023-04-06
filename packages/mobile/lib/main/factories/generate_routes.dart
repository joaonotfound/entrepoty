import 'package:entrepoty/main/main.dart';
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
    GetPage(
      name: Routes.viewModel,
      page: makeModelsViewScreen,
    ),
    GetPage(
      name: Routes.home,
      page: makeAppController,
    ),
    GetPage(
      name: Routes.createCustomer,
      page: () => makeCustomerCreationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.settings,
      page: () => makeSettingsScreen(),
    ),
    GetPage(
      name: Routes.createModel,
      page: makeModelsCreationScreen,
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.createBorrow,
      page: () => makeBorrowCreationScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.createStockItem,
      page: makeStockItemCreationScreen,
      transition: Transition.rightToLeft,
    ),
  ];
}
