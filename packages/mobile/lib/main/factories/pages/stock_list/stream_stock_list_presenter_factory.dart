import 'package:entrepoty/main/factories/factories.dart';
import 'package:entrepoty/presentation/presenters/presenters.dart';

StreamStockListPresenter makeStreamStockListPresenter() {
  return StreamStockListPresenter(
    loadCategories: makeMockedLoadCategories(),
    loadItems: makeRemoteLoadProduct(),
  );
}
