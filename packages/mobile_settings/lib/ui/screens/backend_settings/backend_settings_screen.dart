import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_settings/mobile_settings.dart';

class BackendSettingsScreen extends StatefulWidget {
  BackendSettingsPresenter presenter;

  BackendSettingsScreen({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<BackendSettingsScreen> createState() => _BackendSettingsScreenState();
}

class _BackendSettingsScreenState extends State<BackendSettingsScreen>
    with LoadingManager, UiErrorManager {
  @override
  void initState() {
    widget.presenter.loadCurrentSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Backend's settings"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
          child: Builder(builder: (context) {
            handleUiError(context, widget.presenter.mainErrorStream);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: widget.presenter.domainTextController,
                        validator: (value) =>
                            widget.presenter.validateDomain(value ?? ''),
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
                        controller: widget.presenter.portTextController,
                        validator: (value) =>
                            widget.presenter.validateDomain(value ?? ''),
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
                    onPressed: () => widget.presenter.saveCurrentSettings(),
                    child: const Text("Save"),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
