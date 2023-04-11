import 'package:mobile_products_model/domain/domain.dart';

import '../../data/data.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../ui/ui.dart';

class GetxModelViewPresenter extends GetxController
    with GetxLoadingManager
    implements ModelViewPresenter {
  RemoteCreateEquities remoteCreateEquities;
  RemoteLoadUniqueProductModel loadUniqueProductModel;
  RemoteDeleteProductModel remoteDeleteProductModel;

  final _model = Rx<ProductModelAndDetails?>(null);

  Stream<ProductModelAndDetails?> get modelStream => _model.stream;

  GetxModelViewPresenter({
    required this.remoteCreateEquities,
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
      _model.value = _response;
    });
    isLoading = false;
  }

  @override
  Future<void> generateDetail(ProductModelEntity product, int quantity) async {
    final response =
        await remoteCreateEquities.createEquities(quantity, product);
    response.fold((error) => [], (entities) {
      Get.back();
      Get.to(ModelEquitiesView(details: entities));
    });
  }
}
