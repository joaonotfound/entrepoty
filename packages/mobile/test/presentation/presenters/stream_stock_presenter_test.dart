import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
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
      loadCategories: loadCategories,
      loadItems: loadStockItems,
    );
  });
  group("GetxStockPresenter", () {
    test("should call load categories", () {
      sut.loadScreen();

      verify(() => loadCategories.load()).called(1);
    });
    test("should emit categories", () {
      sut.categoriesStream
          .listen(expectAsync1((categories) => expect(categories, [])));
      sut.loadScreen();
    });
    test("should not emit duplicated values", () {
      sut.categoriesStream
          .listen(expectAsync1((categories) => expect(categories, [])));
      sut.loadScreen();
      sut.loadScreen();
    });
  });
}
