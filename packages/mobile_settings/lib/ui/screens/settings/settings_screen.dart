import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:mobile_core/mobile_core.dart';
import '../../ui.dart';
import 'components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget with NavigationManager {
  final SettingsPresenter presenter;

  SettingsScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    widget.handleNavigation(context, widget.presenter.navigateToStream);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(widget.presenter);
    // debugPrint(themeProvider.isDark.toString());
    return HomeLayout(
        body: Column(
      children: const [
        SettingsDarkToggle(),
        SettingsServer(),
        SettingsLogoutButton(),
      ],
    ));
  }
}
