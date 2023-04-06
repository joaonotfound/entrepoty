import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';

class GetxLoadModelsPresenter extends GetxController
    with GetxLoadingManager, GetxUiErrorManager
    implements ModelListPresenter {
  LoadProductModelsUsecase loadModelsUsecase;
  DeleteProductModelUsecase deleteUescase;

  GetxLoadModelsPresenter({
    required this.loadModelsUsecase,
    required this.deleteUescase,
  });

  final models = Rx<List<ProductModelEntity>>([]);
  Stream<List<ProductModelEntity>?> get modelsEntity => models.stream;

  @override
  Future<void> loadModels() async {
    print("loading products.");
    try {
      isLoading = true;
      final response = await loadModelsUsecase.loadModels();
      response.fold((error) {}, (newModels) {
        models.value = newModels;
      });
    } catch (_) {
      mainError = UiError.unexpected;
    }

    isLoading = false;
  }

  @override
  Future<void> deleteModel(int id) async {
    final response = await deleteUescase.deleteModel(id);
    if (response.isRight()) {
      await loadModels();
    }
  }
}
