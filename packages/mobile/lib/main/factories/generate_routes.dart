import 'package:entrepoty/main/main.dart';
import 'package:get/get.dart';
import 'package:mobile_borrow/mobile_borrow.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products/mobile_products.dart';
import 'package:mobile_settings/mobile_settings.dart';
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
      name: Routes.viewBorrow,
      page: makeBorrowViewScreen,
    ),
    GetPage(
      name: Routes.viewModel,
      page: makeModelViewScreen,
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
        transition: Transition.rightToLeft),
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
      name: Routes.settingsBackend,
      page: makeBackendSettingsScreen,
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.viewCustomer,
      page: makeCustomerViewScreen,
      transition: Transition.rightToLeft,
    )
  ];
}
