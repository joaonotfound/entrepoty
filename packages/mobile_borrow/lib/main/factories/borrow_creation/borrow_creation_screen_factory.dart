import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products_model/main/factories/factories.dart';

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
