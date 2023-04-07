import '../../../domain/domain.dart';

abstract class BorrowViewPresenter {
  Stream<BorrowEntity?> get modelStream;

  Future<void> loadBorrow(int id);
  Future<void> deleteModel(int id);
}