import '../../../domain/domain.dart';

abstract class ModelViewPresenter {
  Stream<ProductModelAndDetails?> get modelStream;

  Future<void> loadModel(int id);

  Future<void> deleteModel(int id);

  Future<void> generateDetail(
    ProductModelEntity product,
    int quantity,
  );
}
