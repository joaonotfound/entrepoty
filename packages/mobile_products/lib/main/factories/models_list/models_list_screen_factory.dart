import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../../presentation/presentation.dart';
import '../../../../ui/ui.dart';
import '../../../../data/data.dart';
import '../../../../main/main.dart';

ModelListScreen makeModelListScreen() {
  return ModelListScreen(
    presenter: GetxLoadModelsPresenter(
      deleteUescase: RemoteDeleteProductModel(
        client: makeFunctionalHttpAdapter(),
        url: BackendUrls.models,
      ),
      loadModelsUsecase: makeRemoteLoadProductModels(),
    ),
  );
}
