import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import './components/components.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color(0xff2b2d42);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.settingsBackend),
            icon: const Icon(
              FluentIcons.settings_20_regular,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xff2b2d42), //Theme.of(context).colorScheme.,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    FluentIcons.box_20_filled,
                    size: 140,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const LaunchDescription(),
                      Column(
                        children: const [
                          LaunchLoginButton(),
                          SizedBox(height: 5),
                          LaunchSignupButton(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
