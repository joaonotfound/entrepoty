import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';

import '../../domain/domain.dart';
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
    isLoading = true;
    final response = await usecase.loadAll();
    response.fold(
      (error) => mainError = fromDomain(error),
      (borrows) {
        _borrows.value = borrows;
      },
    );

    isLoading = false;
  }
}
