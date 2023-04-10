import 'package:flutter/material.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:provider/provider.dart';
import 'components/components.dart';

import 'model_creation_presenter.dart';

class ModelCreationScreen extends StatefulWidget {
  final ModelCreationPresenter presenter;

  ModelCreationScreen({
    super.key,
    required this.presenter,
  });

  @override
  State<ModelCreationScreen> createState() => _ModelCreationScreenState();
}

class _ModelCreationScreenState extends State<ModelCreationScreen>
    with LoadingManager, NavigationManager, UiErrorManager {
  @override
  void initState() {
    handleLoading(context, widget.presenter.isLoadingStream);
    handleNavigation(context, widget.presenter.navigateToStream);
    handleUiError(context, widget.presenter.mainErrorStream);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => widget.presenter,
      child: FormLayout(
        content: Form(
          child: ListView(children: [
            ModelCreationNameField(),
            ModelCreationCategories(),
            ModelCreationQuantities(),
            ModelCreationImagePicker()
          ]),
        ),
        action: ModelCreationSubmit(),
        title: "Create Product Model",
      ),
    );
  }
}
