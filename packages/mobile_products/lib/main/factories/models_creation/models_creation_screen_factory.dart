
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../../data/data.dart';
import '../../../../presentation/presentation.dart';
import '../../../../ui/ui.dart';

ModelCreationScreen makeModelsCreationScreen() {
  return ModelCreationScreen(
    presenter: GetxModelCreationPresenter(
      validation: ValidationComposite(validators: [
        const RequiredFormFieldValidator(field: "model-name"),
      ]),
      takeImage: ImagePickerTakeImage(),
      usecase: RemoteCreateProductModel(
        client: makeFunctionalHttpAdapter(),
        url: BackendUrls.models,
      ),
    ),
  );
}
