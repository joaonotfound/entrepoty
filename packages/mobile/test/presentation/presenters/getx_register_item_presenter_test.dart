import 'package:entrepoty/ui/ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:entrepoty/presentation/presenters/getx_stock_item_creation_presenter.dart';

import '../../domain/mocks/load_models_usecase_mock.dart';

void main() {
  late GetxStockItemCreationPresenter sut;
  late LoadModelsUsecaseMock loadModels;
  setUp(() {
    loadModels = LoadModelsUsecaseMock();
    sut = GetxStockItemCreationPresenter(loadModelsUsecase: loadModels);
  });
  group("GetxRegisterLotPresenter", () {
    test("should emit empty error when validating model", () {
      sut.modelErrorStream.listen(
          expectAsync1((value) => expect(value, "This field is mandatory.")));
      sut.validateModel("");
    });
    test("should emit invalid value error when validating quantity", () {
      sut.qtdErrorStream
          .listen(expectAsync1((value) => expect(value, "Invalid number.")));
      sut.validateQtd(0);
    });
    test("should emit invalid value error when validating quantity", () {
      sut.qtdErrorStream
          .listen(expectAsync1((value) => expect(value, "Invalid number.")));
      sut.validateQtd(-1);
    });
    test("should emit no error when validating quantity", () {
      sut.qtdErrorStream.listen(expectAsync1((value) => expect(value, "")));
      sut.validateQtd(345);
    });

    test("should emit valid form on valid fields", () {
      sut.validateModel("valid-model");

      sut.isFormValidStream
          .listen(expectAsync1((value) => expect(value, true)));

      sut.validateQtd(1);
    });
    test("should emit invalid on invalid fields", () {
      sut.isFormValidStream
          .listen(expectAsync1((value) => expect(value, false)));

      sut.validateModel("invalid-model");
      sut.validateQtd(-1);

      sut.validateForm();
    });
    test("should emit invalid if model is an empty string", () {
      sut.isFormValidStream
          .listen(expectAsync1((value) => expect(value, false)));
      sut.validateForm();
    });
    test("should emit invalid if qtd is zero", () {
      sut.isFormValidStream
          .listen(expectAsync1((value) => expect(value, false)));

      sut.validateModel("valid-model");

      sut.validateForm();
    });
    test("should redirect to stocks page", () {
      sut.navigateToStream
          .listen(expectAsync1((value) => expect(value, Routes.stock)));
      sut.validateModel("any-model");
      sut.validateQtd(1);

      sut.saveItem();
    });
    test("should emit no error when validating model", () {
      sut.modelErrorStream.listen(expectAsync1((value) => expect(value, "")));
      sut.validateModel("valid-model");
    });
  });
}
