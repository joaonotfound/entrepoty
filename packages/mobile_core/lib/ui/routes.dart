class Routes {
  static const splash = "/splash";
  static const launch = '/launch';
  static const signup = "/signup";
  static const login = '/login';
  static const home = '/home';
  static const settings = '/settings';
  static const createCustomer = '/customers/create';
  static const createStockItem = '/stock/create';
  static const createModel = '/models/create';

  static const settingsBackend = "/settings/backend";

  static const viewModel = "/models/view/:id";
  static getViewModel(int id) => "/models/view/$id";

  static const viewBorrow = "/borrow/view/:id";
  static getViewBorrow(int id) => "/borrow/view/$id";

  static const viewCustomer = '/customers/view/:enrollment';
  static getViewCustomer(String enrollment) => "/customers/view/$enrollment";

  static const createBorrow = '/borrow/create';

}
