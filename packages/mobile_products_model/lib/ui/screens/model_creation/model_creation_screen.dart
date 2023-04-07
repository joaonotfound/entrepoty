import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';

import 'model_creation_presenter.dart';

class ModelCreationScreen extends StatelessWidget
    with LoadingManager, NavigationManager, UiErrorManager {
  final ModelCreationPresenter presenter;
  ModelCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => presenter,
      child: Builder(
        builder: (context) {
          handleLoading(context, presenter.isLoadingStream);
          handleNavigation(context, presenter.navigateToStream);
          handleUiError(context, presenter.mainErrorStream);

          return FormLayout(
            content: Form(
              child: ListView(children: [
                ModelCreationNameField(),
                ModelCreationCategories(),
                ModelCreationImagePicker()
              ]),
            ),
            action: ModelCreationSubmit(),
            title: "Create Product Model",
          );
        },
      ),
    );
  }
}
