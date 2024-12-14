import 'package:get/get.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mobile_customers/mobile_customers.dart';
import 'package:mobile_products/mobile_products.dart';
import '../../domain/domain.dart';
import '../../ui/ui.dart';

class GetxBorrowCreationPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxUiErrorManager,
        GetxFormManager,
        GetxNavigatorManager
    implements BorrowCreationPresenter {
  LoadAllEquitiesUsecase loadAllEquitiesUsecase;
  LoadCustomersUsecase loadCustomersUsecase;
  CreateBorrowUsecase createBorrowUsecase;

  GetxBorrowCreationPresenter({
    required this.loadAllEquitiesUsecase,
    required this.loadCustomersUsecase,
    required this.createBorrowUsecase,
  });

  CustomerEntity? _customer;
  ProductDetailWithProduct? _product;
  DateTime? _date;

  final _customers = Rx<List<CustomerEntity>>([]);

  @override
  Stream<List<CustomerEntity>> get customersStream => _customers.stream;

  final _products = Rx<List<ProductDetailWithProduct>>([]);

  @override
  Stream<List<ProductDetailWithProduct>> get productsStream => _products.stream;

  @override
  Future<void> create() async {
    isLoading = true;
    final response = await createBorrowUsecase.create(
      equity: _product!.equity,
      customer: int.parse(_customer!.id),
      date: _date!,
    );
    isLoading = false;
    response.fold(
      (error) => mainError = fromDomain(error),
      (borrow) {
        Get.back();
      },
    );
  }

  void _validateForm() {
    isFormValid = _customer != null && _product != null && _date != null;
  }

  @override
  void validateCustomer(CustomerEntity customer) {
    _customer = customer;
    _validateForm();
  }

  @override
  void validateDate(DateTime date) {
    _date = date;
    _validateForm();
  }

  @override
  void validateProduct(ProductDetailWithProduct product) {
    _product = product;
    _validateForm();
  }

  @override
  Future<void> loadCustomers() async {
    _customers.value = await loadCustomersUsecase.loadCustomers();
  }

  @override
  Future<void> loadProducts() async {
    final response = await loadAllEquitiesUsecase.load();
    response.fold(
      (error) => mainError = fromDomain(error),
      (products) {
        _products.value = products;
      },
    );
  }
}
