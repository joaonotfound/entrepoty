import 'package:flutter/material.dart';

import '../components/error_message.dart';

mixin UiErrorManager {
  void handleUiError(BuildContext context, Stream stream) =>
      stream.listen((error) => showErrorMessage(context, error));
}
