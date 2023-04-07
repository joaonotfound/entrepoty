import 'package:flutter/material.dart';

import '../ui.dart';

mixin UiErrorManager {
  void handleUiError(BuildContext context, Stream<UiError?> stream) =>
      stream.listen(
        (error) => showErrorMessage(
          context,
          error != null ? error.description : UiError.unexpected.description,
        ),
      );
}
