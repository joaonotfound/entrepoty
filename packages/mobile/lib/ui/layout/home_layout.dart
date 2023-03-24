import 'package:flutter/material.dart';

import '../components/components.dart';

class HomeLayout extends StatelessWidget {
  Widget body;
  Widget? floatingActionButton;
  AppBar? appBar;
  HomeLayout(
      {super.key, required this.body, this.floatingActionButton, this.appBar});

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
