import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presentation.dart';
import 'package:entrepoty/ui/ui.dart';

BorrowListScreen makeBorrowScreen() {
  return BorrowListScreen(
    presenter: GetxBorrowListPresenter(
      usecase: makeRemoteLoadBorrow(),
    ),
  );
}
