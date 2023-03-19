import 'package:flutter/material.dart';
import '../factories/factories.dart';

class FormLayout extends StatelessWidget {
  Widget content;
  Widget action;
  String title;
  FormLayout({
    super.key,
    required this.content,
    required this.action,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: makeFormAppbar(title),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 35),
          child: Column(
            children: [
              Expanded(
                child: content,
                flex: 1,
              ),
              Align(child: action)
            ],
          ),
        ),
      ),
    );
  }
}
