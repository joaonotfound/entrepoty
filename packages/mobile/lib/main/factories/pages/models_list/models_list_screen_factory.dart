import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/main/main.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_remote/mobile_remote.dart';

import '../../../../presentation/presentation.dart';

ModelListScreen makeModelListScreen() {
  return ModelListScreen(
    presenter: GetxLoadModelsPresenter(
      deleteUescase: RemoteDeleteProductModel(
        client: makeHttpAdapter(),
        url: BackendUrls.models,
      ),
      loadModelsUsecase: makeRemoteLoadProductModels(),
    ),
  );
}
