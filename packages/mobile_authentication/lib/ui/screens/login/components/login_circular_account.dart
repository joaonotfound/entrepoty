import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class LoginCircularAccount extends StatelessWidget {
  const LoginCircularAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        FluentIcons.person_circle_32_filled,
        size: MediaQuery.of(context).size.height * 0.15,
        color: Theme.of(context).colorScheme.onSurface.withAlpha(180),
      ),
    );
  }
}
