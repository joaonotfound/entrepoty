class Routes {
  static final splash = "/splash";
  static final launch = '/launch';
  static final signup = "/signup";
  static final login = '/login';
  static final home = '/home';
  static final stock = "/stock";
  static final settings = '/settings';
  static final createCustomer = '/customers/create';
  static final createStockItem = '/stock/create';
  static final createModel = '/models/create';

  static final viewModel = "/models/view/:id";
  static getViewModel(int id) => "/models/view/$id";

  static final viewBorrow = "/borrow/view/:id";
  static getBorrowModel(int id) => "/borrow/view/$id";

  static final createBorrow = '/borrow/create';

}
