import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:entrepoty/presentation/presenters/presenters.dart';

import '../../domain/domain.dart';

void main() {
  late StreamStockListPresenter sut;
  late MockLoadCategories loadCategories;
  late LoadProductsMock loadStockItems;
  setUp(() {
    loadCategories = MockLoadCategories();
    loadCategories.mockLoad([]);
    loadStockItems = LoadProductsMock();
    loadStockItems.mockLoad(Either.right([]));
    sut = StreamStockListPresenter(
      loadItems: loadStockItems,
    );
    Get.testMode = true;
    TestWidgetsFlutterBinding.ensureInitialized();
  });
}
