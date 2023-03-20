import 'package:flutter/material.dart';

class CircularAccount extends StatelessWidget {
  const CircularAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.account_circle_sharp,
        size: MediaQuery.of(context).size.height * 0.15,
        color: Theme.of(context).colorScheme.onBackground.withAlpha(180),
      ),
    );
  }
}
