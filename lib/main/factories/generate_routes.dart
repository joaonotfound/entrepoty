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
    GetPage(name: Routes.home, page: makeAppController),
    GetPage(
      name: Routes.createUser,
      page: () => CreateUserScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.createStockItem,
      page: makeRegisterItemScreen,
      transition: Transition.rightToLeft,
    ),
  ];
}
