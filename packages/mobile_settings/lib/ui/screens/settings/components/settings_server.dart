import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

class SettingsServer extends StatefulWidget {
  const SettingsServer({Key? key}) : super(key: key);

  @override
  State<SettingsServer> createState() => _SettingsServerState();
}

class _SettingsServerState extends State<SettingsServer> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.settingsBackend),
      child: const ListTile(
        leading: Icon(FluentIcons.server_multiple_20_regular),
        title: Text("Configure server"),
      ),
    );
  }
}
