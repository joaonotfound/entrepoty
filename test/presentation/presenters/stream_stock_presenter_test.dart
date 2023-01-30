import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/presentation/presenters/presenters.dart';

import '../../mocks/mocks.dart';

void main() {
  late StreamStockPresenter sut;
  late MockLoadCategories loadCategories;
  setUp(() {
    loadCategories = MockLoadCategories();
    loadCategories.mockLoad([]);
    sut = StreamStockPresenter(loadCategories: loadCategories);
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
