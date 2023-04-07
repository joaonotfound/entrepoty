import '../../../presentation/presentation.dart';
import '../../../ui/ui.dart';
import '../usecase/usecase.dart';

BorrowListScreen makeBorrowScreen() {
  return BorrowListScreen(
    presenter: GetxBorrowListPresenter(
      usecase: makeRemoteLoadBorrow(),
    ),
  );
}
