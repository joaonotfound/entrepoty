import '../components/components.dart';
import '../errors/errors.dart';
import 'package:flutter/material.dart';

mixin UiErrorManager {
  void handleUiError(BuildContext context, Stream<UiError?> stream) =>
      stream.listen(
        (error) => showErrorMessage(
          context,
          error != null ? error.description : UiError.unexpected.description,
        ),
      );
}
