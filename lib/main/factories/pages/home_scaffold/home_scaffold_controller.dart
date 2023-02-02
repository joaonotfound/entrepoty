import 'package:service_desk_2/main/factories/pages/pages.dart';
import 'package:service_desk_2/ui/ui.dart';

HomeScaffoldController makeHomeScaffoldController() {
  return HomeScaffoldController(screens: makeHomeScaffoldScreens());
}
