import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/presentation/presenters/presenters.dart';

import '../../mocks/mocks.dart';

void main() {
  late GetxStockPresenter sut;
  late MockLoadCategories loadCategories;
  setUp(() {
    loadCategories = MockLoadCategories();
    loadCategories.mockLoad([]);
    sut = GetxStockPresenter(loadCategories: loadCategories);
  });
  group("GetxStockPresenter", () {
    test("should call load categories", () {
      sut.loadScreen();

      verify(() => loadCategories.load()).called(1);
    });
  });
}
