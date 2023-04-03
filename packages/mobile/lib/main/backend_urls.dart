class BackendUrls {
  static final production = false;
  static final _productionUrl = "http://google.com:3000";
  static final _developmentUrl = "http://10.0.2.2:8080";

  static String _complete(String url) {
    return (production ? _productionUrl : _developmentUrl) + url;
  }

  static String get login => _complete("/api/v1/auth/login");
  static String get signup => _complete("/api/v1/auth/signup");
  static String get customers => _complete("/api/v1/customers");
  static String get models => _complete("/api/v1/models");
  static String get products => _complete("/api/v1/products");
  static String get borrows => _complete("/api/v1/borrows");
}
