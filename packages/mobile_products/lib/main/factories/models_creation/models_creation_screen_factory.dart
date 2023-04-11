
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../../data/data.dart';
import '../../../../presentation/presentation.dart';
import '../../../../ui/ui.dart';

ModelCreationScreen makeModelsCreationScreen() {
  return ModelCreationScreen(
    presenter: GetxModelCreationPresenter(
      validation: ValidationComposite(validators: [
        RequiredFieldValidator(field: "model-name"),
      ]),
      takeImage: ImagePickerImpl(),
      usecase: RemoteCreateProductModel(
        client: makeHttpAdapter(),
        url: BackendUrls.models,
      ),
    ),
  );
}
