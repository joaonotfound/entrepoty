import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/getx_borrow_creation_presenter.dart';
import 'package:entrepoty/ui/screens/screens.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products/mobile_products.dart';

BorrowCreationScreen makeBorrowCreationScreen() {
  return BorrowCreationScreen(
    presenter: GetxBorrowCreationPresenter(
      loadCustomersUsecase: makeRemoteLoadCustomers(),
      loadProductsUsecase: makeRemoteLoadProduct(),
      createBorrowUsecase: makeRemoteCreateBorrow(),
    ),
  );
}
