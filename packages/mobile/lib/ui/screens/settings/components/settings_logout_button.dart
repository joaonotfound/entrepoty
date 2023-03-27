import 'package:entrepoty/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SettingsLogoutButton extends StatelessWidget {
  const SettingsLogoutButton({super.key});
  void _askConfirmation(BuildContext context) async {
    final logout = Get.find<SettingsPresenter>();
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Are you sure?"),
        content: SingleChildScrollView(
          child: ListBody(
            children: const [
              Text("You are about to sign out."),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Cancel")),
          TextButton(onPressed: () => logout.logout(), child: const Text("Ok")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);

    return ElevatedButton(
      onPressed: () => _askConfirmation(context),
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
