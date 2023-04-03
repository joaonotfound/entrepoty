import 'package:entrepoty/data/data.dart';
import 'package:entrepoty/data/usecases/load_product_models/load_product_models.dart';
import 'package:entrepoty/main/main.dart';
import 'package:entrepoty/presentation/presenters/getx_load_models_presenter.dart';
import 'package:entrepoty/ui/screens/model/model.dart';

ModelListScreen makeModelListScreen() {
  return ModelListScreen(
    presenter: GetxLoadModelsPresenter(
      deleteUescase: RemoteDeleteProductModel(
        client: makeHttpAdapter(),
        url: BackendUrls.models,
      ),
      loadModelsUsecase: RemoteLoadProductModels(
          client: makeHttpAdapter(), url: BackendUrls.models),
    ),
  );
}
