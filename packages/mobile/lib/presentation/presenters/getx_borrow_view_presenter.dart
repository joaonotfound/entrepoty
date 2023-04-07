import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/ui/ui.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

class GetxBorrowViewPresenter extends GetxController with GetxLoadingManager implements BorrowViewPresenter {
  LoadUniqueBorrowUsecase loadUniqueBorrow;
  
  GetxBorrowViewPresenter({
    required this.loadUniqueBorrow,
  });

  final _borrow = Rx<BorrowEntity?>(null);

  Stream<BorrowEntity?> get modelStream => _borrow.stream;

  Future<void> deleteModel(int id) async {}

  Future<void> loadBorrow(int id) async {
    isLoading = true;
    final response = await loadUniqueBorrow.loadBorrowById(id);
    response.fold((error) {
      print("an error ocurred while loading unique borrow" + error.toString());
    }, (_response) => _borrow.value = _response);
    isLoading = false;
  }
}
