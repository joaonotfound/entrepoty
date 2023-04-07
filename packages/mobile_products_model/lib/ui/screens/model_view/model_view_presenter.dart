import '../../../domain/domain.dart';

abstract class ModelViewPresenter {
  Stream<ProductModelEntity?> get modelStream;

  Future<void> loadModel(int id);
  Future<void> deleteModel(int id);
}
