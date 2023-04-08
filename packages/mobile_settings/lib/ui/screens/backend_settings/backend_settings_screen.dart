import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BackendSettingsScreen extends StatelessWidget {
  const BackendSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backend's settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon:
                              Icon(FluentIcons.virtual_network_20_regular),
                          hintText: "https://yourdomain.com",
                          label: Text("Backend's domain")),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(FluentIcons.door_20_regular),
                          hintText: "3000",
                          label: Text("Backend's port")),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
