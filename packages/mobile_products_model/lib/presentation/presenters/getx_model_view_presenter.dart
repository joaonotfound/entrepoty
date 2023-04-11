import '../../data/data.dart';
import '../../domain/entities/product_model_entity.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../ui/ui.dart';

class GetxModelViewPresenter extends GetxController
    with GetxLoadingManager
    implements ModelViewPresenter {
  RemoteLoadUniqueProductModel loadUniqueProductModel;
  RemoteDeleteProductModel remoteDeleteProductModel;

  final _model = Rx<ProductModelEntity?>(null);

  Stream<ProductModelEntity?> get modelStream => _model.stream;

  GetxModelViewPresenter({
    required this.loadUniqueProductModel,
    required this.remoteDeleteProductModel,
  });

  Future<void> deleteModel(int id) async {
    isLoading = true;
    final response = await remoteDeleteProductModel.deleteModel(id);
    response.fold((l) {}, (account) {
      Get.back();
    });
    isLoading = false;
  }

  Future<void> loadModel(int id) async {
    isLoading = true;
    final response = await loadUniqueProductModel.loadModelById(id);
    response.fold((error) {
      print("an error ocurred while loading unique model" + error.toString());
    }, (_response) {
      _model.value = _response.product;
    });
    isLoading = false;
  }
}
