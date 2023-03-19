import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/presenters.dart';

StreamStockPresenter makeStreamStockPresenter() {
  return StreamStockPresenter(
    loadCategories: makeMockedLoadCategories(),
    loadItems: makeMockedLoadStockItems(),
  );
}
