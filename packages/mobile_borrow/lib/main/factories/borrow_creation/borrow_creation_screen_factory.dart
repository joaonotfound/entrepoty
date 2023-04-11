import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products/mobile_products.dart';

import '../../../presentation/presentation.dart';
import '../../../ui/screens/screens.dart';
import '../usecase/usecase.dart';

BorrowCreationScreen makeBorrowCreationScreen() {
  return BorrowCreationScreen(
    presenter: GetxBorrowCreationPresenter(
      loadAllEquitiesUsecase: makeRemoteLoadAllEquities(),
      loadCustomersUsecase: makeRemoteLoadCustomers(),
      createBorrowUsecase: makeRemoteCreateBorrow(),
    ),
  );
}
