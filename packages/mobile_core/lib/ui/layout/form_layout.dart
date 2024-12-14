import 'package:flutter/material.dart';

import '../../mobile_core.dart';

class FormLayout extends StatelessWidget {
  final Widget content;
  final Widget action;
  final String title;
  const FormLayout({
    super.key,
    required this.content,
    required this.action,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       appBar: makeFormAppbar(title),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 35),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: content,
              ),
              Align(child: action)
            ],
          ),
        ),
      ),
    );
  }
}
