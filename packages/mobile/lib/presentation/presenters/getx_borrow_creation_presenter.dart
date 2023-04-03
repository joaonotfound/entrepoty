import 'package:entrepoty/domain/domain.dart';
import 'package:entrepoty/domain/entities/product_entity.dart';
import 'package:entrepoty/domain/entities/customer_entity.dart';
import 'package:entrepoty/presentation/mixins/getx_form_manager.dart';
import 'package:entrepoty/presentation/mixins/getx_loading_manager.dart';
import 'package:entrepoty/presentation/mixins/getx_navigator_manager.dart';
import 'package:entrepoty/presentation/mixins/gext_ui_error_manager.dart';
import 'package:entrepoty/ui/screens/borrow/borrow_creation/borrow_creation_presenter.dart';
import 'package:get/get.dart';

class GetxBorrowCreationPresenter extends GetxController
    with
        GetxLoadingManager,
        GetxUiErrorManager,
        GetxFormManager,
        GetxNavigatorManager
    implements BorrowCreationPresenter {
  LoadCustomersUsecase loadCustomersUsecase;
  LoadProductsUsecase loadProductsUsecase;
  CreateBorrowUsecase createBorrowUsecase;

  GetxBorrowCreationPresenter({
    required this.loadCustomersUsecase,
    required this.loadProductsUsecase,
    required this.createBorrowUsecase,
  });

  CustomerEntity? _customer = null;
  ProductEntity? _product = null;
  DateTime? _date = null;

  final _customers = Rx<List<CustomerEntity>>([]);
  Stream<List<CustomerEntity>> get customersStream => _customers.stream;

  final _products = Rx<List<ProductEntity>>([]);
  Stream<List<ProductEntity>> get productsStream => _products.stream;

  Future<void> create() async {
    isLoading = true;
    final response = await createBorrowUsecase.create(
      product: _product!.id,
      customer: int.parse(_customer!.id),
      date: _date!,
    );
    isLoading = false;
    response.fold((l) {
      print(l);
    }, (borrow) {
      print("created");
      Get.back();
    });
  }

  void _validateForm() {
    print(_customer);
    print(_product);
    print(_date);

    isFormValid = _customer != null && _product != null && _date != null;
  }

  void validateCustomer(CustomerEntity customer) {
    _customer = customer;
    _validateForm();
  }

  void validateDate(DateTime date) {
    _date = date;
    _validateForm();
  }

  void validateProduct(ProductEntity product) {
    _product = product;
    _validateForm();
  }

  @override
  Future<void> loadCustomers() async {
    _customers.value = await loadCustomersUsecase.loadCustomers();
  }

  @override
  Future<void> loadProducts() async {
    final response = await loadProductsUsecase.loadProducts();
    response.fold((l) {}, (products) {
      _products.value = products;
    });
  }
}
