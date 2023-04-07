
import '../../../presentation/presentation.dart';
import '../factories.dart';

StreamStockListPresenter makeStreamStockListPresenter() {
  return StreamStockListPresenter(
    loadItems: makeRemoteLoadProduct(),
  );
}
