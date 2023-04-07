import 'package:entrepoty/domain/domain.dart';
import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../ui/ui.dart';

class GetxBorrowListPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxUiErrorManager,
        GetxNavigatorManager,
        GetxFormManager
    implements BorrowListPresenter {
  LoadBorrowUsecase usecase;

  GetxBorrowListPresenter({
    required this.usecase,
  });

  final _borrows = Rx<List<BorrowEntity>>([]);
  Stream<List<BorrowEntity>?> get borrowsStream => _borrows.stream;

  @override
  Future<void> loadBorrows() async {
    try {
      isLoading = true;
      final response = await usecase.loadAll();
      response.fold((l) {}, (borrows) {
        _borrows.value = borrows;
      });
    } catch (_) {
      mainError = UiError.unexpected;
    }

    isLoading = false;
  }
}
