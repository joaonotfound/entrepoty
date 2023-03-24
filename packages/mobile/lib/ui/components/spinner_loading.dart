import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Se autenticando",
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
      barrierDismissible: false);
}

void hideLoading(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}
