import 'package:flutter/material.dart';

import '../components/components.dart';

class HomeLayout extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final AppBar? appBar;

  HomeLayout({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: makeBottomNavigationBar(),
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: body,
        ),
      ),
    );
  }
}
