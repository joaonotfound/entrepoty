import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import './components/components.dart';
import 'package:flutter/material.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.settingsBackend),
            icon: Icon(
              FluentIcons.settings_20_regular,
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff0014cc), //Theme.of(context).colorScheme.,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Icon(
                      FluentIcons.box_20_filled,
                      size: 140,
                    ),
                  ),
                  //child: Image.asset("lib/ui/assets/launch_image.png"),
                  flex: 1,
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        LaunchDescription(),
                        Column(
                          children: [
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
      ),
    );
  }
}
