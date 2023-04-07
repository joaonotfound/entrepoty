import '../../../presentation/presentation.dart';
import '../../../ui/screens/screens.dart';
import '../usecase/usecase.dart';

BorrowViewScreen makeBorrowViewScreen() {
  return BorrowViewScreen(
    presenter: GetxBorrowViewPresenter(
      loadUniqueBorrow: makeRemoteLoadUniqueBorrow(),
    ),
  );
}
