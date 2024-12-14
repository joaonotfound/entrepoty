import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../ui.dart';
import 'components/components.dart';

class SettingsScreen extends StatefulWidget with NavigationManager {
  final SettingsPresenter presenter;

  SettingsScreen({
    required this.presenter, super.key,
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
    return const HomeLayout(
        body: Column(
      children: [
        SettingsDarkToggle(),
        SettingsServer(),
        SettingsLogoutButton(),
      ],
    ),);
  }
}
