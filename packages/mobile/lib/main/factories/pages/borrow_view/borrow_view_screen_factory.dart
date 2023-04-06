import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/screens/borrow/borrow.dart';

BorrowViewScreen makeBorrowViewScreen() {
  return BorrowViewScreen(
    presenter: GetxBorrowViewPresenter(
      loadUniqueBorrow: makeRemoteLoadUniqueBorrow(),
    ),
  );
}
