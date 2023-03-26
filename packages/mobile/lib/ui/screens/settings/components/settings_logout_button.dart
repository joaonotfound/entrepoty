import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsLogoutButton extends StatelessWidget {
  const SettingsLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(Theme.of(context).colorScheme.surface),
      ),
      child: Text(
        "Logout account",
        style: TextStyle(
          color: provider.isDark.value ? Color(0xffFEE8E7) : Color(0xff6F0D06),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
