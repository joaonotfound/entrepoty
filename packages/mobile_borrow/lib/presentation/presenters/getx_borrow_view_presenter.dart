import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';
import '../../ui/ui.dart';

class GetxBorrowViewPresenter extends GetxController with GetxLoadingManager implements BorrowViewPresenter {
  LoadUniqueBorrowUsecase loadUniqueBorrow;
  
  GetxBorrowViewPresenter({
    required this.loadUniqueBorrow,
  });

  final _borrow = Rx<BorrowEntity?>(null);

  @override
  Stream<BorrowEntity?> get modelStream => _borrow.stream;

  @override
  Future<void> deleteModel(int id) async {}

  @override
  Future<void> loadBorrow(int id) async {
    isLoading = true;
    final response = await loadUniqueBorrow.loadBorrowById(id);
    response.fold((error) {
      print("an error ocurred while loading unique borrow$error");
    }, (response) => _borrow.value = response);
    isLoading = false;
  }
}
