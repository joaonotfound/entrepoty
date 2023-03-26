import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/providers.dart';

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
      title: Text("Dark mode"),
      value: themeProvider.isDark.value,
      onChanged: (_) => setState(
        () => themeProvider.setIsDark(!themeProvider.isDark.value),
      ),
    );
  }
}
