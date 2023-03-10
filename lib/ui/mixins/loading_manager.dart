import 'package:flutter/material.dart';

import '../components/components.dart';

mixin LoadingManager {
  void handleLoginManager(BuildContext context, Stream stream) {
    stream.listen((isLoading) {
      if (isLoading == true) {
        showLoading(context);
      } else {
        hideLoading(context);
      }
    });
  }
}
