import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/presenters.dart';

StreamStockPresenter makeStreamStockListPresenter() {
  return StreamStockPresenter(
    loadCategories: makeMockedLoadCategories(),
    loadItems: makeMockedLoadStockItems(),
  );
}
