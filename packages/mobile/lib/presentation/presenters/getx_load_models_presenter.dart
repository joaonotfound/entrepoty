import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/presentation/mixins/getx_loading_manager.dart';
import 'package:entrepoty/presentation/mixins/gext_ui_error_manager.dart';
import 'package:entrepoty/ui/screens/model/model.dart';
import 'package:fpdart/src/either.dart';
import 'package:get/get.dart';

import '../../ui/misc/misc.dart';

class GetxLoadModelsPresenter extends GetxController
    with GetxLoadingManager, GetxUiErrorManager
    implements ModelListPresenter {
  LoadProductModelsUsecase usecase;
  GetxLoadModelsPresenter({
    required this.usecase,
  });

  final models = Rx<List<ProductModelEntity>>([]);
  Stream<List<ProductModelEntity>?> get modelsEntity => models.stream;

  @override
  Future<void> loadModels() async {
    try {
      isLoading = true;
      final response = await usecase.loadModels();
      response.fold((error) {
        mainError = fromDomain(error);
      }, (newModels) {
        models.value = newModels;
      });
    } catch (_) {
      mainError = UiError.unexpected;
    }

    isLoading = false;
  }
}
