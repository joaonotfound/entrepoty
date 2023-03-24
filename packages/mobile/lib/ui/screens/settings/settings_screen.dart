import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    // debugPrint(themeProvider.isDark.toString());
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.close),
        onPressed: () => Get.back(),
      )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Switch(
                value: themeProvider.isDark.value,
                onChanged: (_) => setState(
                  () => themeProvider.setIsDark(!themeProvider.isDark.value),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
