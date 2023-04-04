import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/infra/imagepicker/imagepicker.dart';
import 'package:entrepoty/main/main.dart';
import 'package:entrepoty/presentation/presenters/getx_model_creation_presenter.dart';
import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:entrepoty/validation/validation.dart';

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
