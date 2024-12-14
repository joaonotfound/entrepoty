import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../data/data.dart';
import '../../domain/domain.dart';
import '../../ui/ui.dart';

class GetxModelViewPresenter extends GetxController
    with GetxLoadingManager
    implements ModelViewPresenter {
  RemoteCreateEquities remoteCreateEquities;
  RemoteLoadUniqueProductModel loadUniqueProductModel;
  RemoteDeleteProductModel remoteDeleteProductModel;

  final _model = Rx<UniqueProductEntity?>(null);

  @override
  Stream<UniqueProductEntity?> get modelStream => _model.stream;

  GetxModelViewPresenter({
    required this.remoteCreateEquities,
    required this.loadUniqueProductModel,
    required this.remoteDeleteProductModel,
  });

  @override
  Future<void> deleteModel(int id) async {
    isLoading = true;
    final response = await remoteDeleteProductModel.deleteModel(id);
    response.fold(
      (_) {},
      (account) {
        Get.back();
      },
    );
    isLoading = false;
  }

  @override
  Future<void> loadModel(int id) async {
    isLoading = true;
    final response = await loadUniqueProductModel.loadModelById(id);
    response.fold((error) {
      print('an error ocurred while loading unique model$error');
    }, (response) {
      _model.value = response;
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
