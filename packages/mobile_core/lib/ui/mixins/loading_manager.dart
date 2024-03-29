import 'package:flutter/material.dart';

import '../ui.dart';

mixin LoadingManager {
  void handleLoading(BuildContext context, Stream stream) {
    stream.listen((isLoading) {
      if (isLoading == true) {
        showLoading(context);
      } else {
        hideLoading(context);
      }
    });
  }
}
