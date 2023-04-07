import 'package:entrepoty/ui/ui.dart';
import 'package:mobile_core/mobile_core.dart';
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
  Widget build(BuildContext context) {
    Get.put(widget.presenter);
    // debugPrint(themeProvider.isDark.toString());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: const Text("Settings & Privacy"),
      ),
      body: Builder(
        builder: (context) {
          widget.handleNavigation(context, widget.presenter.navigateToStream);
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Column(
                children: const [
                  SettingsDarkToggle(),
                  SettingsLogoutButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
