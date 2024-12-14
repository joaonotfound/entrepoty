import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';

class SettingsDarkToggle extends StatefulWidget {
  const SettingsDarkToggle({super.key});

  @override
  State<SettingsDarkToggle> createState() => _SettingsDarkToggleState();
}

class _SettingsDarkToggleState extends State<SettingsDarkToggle> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SwitchListTile(
      title: const Text('Dark mode'),
      value: themeProvider.isDark.value,
      onChanged: (_) => setState(
        () => themeProvider.setIsDark(!themeProvider.isDark.value),
      ),
    );
  }
}
