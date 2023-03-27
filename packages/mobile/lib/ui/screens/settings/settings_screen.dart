import 'package:entrepoty/ui/screens/screens.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  SettingsPresenter presenter;
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
          icon: Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: Text("Settings & Privacy"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            children: [
              SettingsDarkToggle(),
              SettingsLogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
