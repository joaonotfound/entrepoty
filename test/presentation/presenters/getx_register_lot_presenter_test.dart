import 'package:flutter_test/flutter_test.dart';
import 'package:service_desk_2/domain/entities/entities.dart';
import 'package:service_desk_2/presentation/presenters/getx_register_lot_presenter.dart';

void main() {
  late GetxRegisterLotPresenter sut;
  setUp(() {
    sut = GetxRegisterLotPresenter();
  });
  group("GetxRegisterLotPresenter", () {
    test("should emit empty error when validating model", () {
      sut.modelErrorStream.listen(
          expectAsync1((value) => expect(value, "Este campo é obrigatório.")));
      sut.validateModel("");
    });
    test("should emit invalid value error when validating quantity", () {
      sut.qtdErrorStream
          .listen(expectAsync1((value) => expect(value, "Número inválido.")));
      sut.validateQtd(0);
    });
    test("should emit invalid value error when validating quantity", () {
      sut.qtdErrorStream
          .listen(expectAsync1((value) => expect(value, "Número inválido.")));
      sut.validateQtd(-1);
    });
    test("should emit no error when validating quantity", () {
      sut.qtdErrorStream.listen(expectAsync1((value) => expect(value, "")));
      sut.validateQtd(345);
    });
    test("should emit valid form on valid fields", () {
      sut.isFormValidStream
          .listen(expectAsync1((value) => expect(value, true)));

      sut.validateModel("valid-model");
      sut.validateQtd(1);

      sut.validateForm();
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
    test("should emit create stock item", () {
      sut.itemsStreams.listen(expectAsync1(
          (value) => expect(value[0], isInstanceOf<CreateStockItemEntity>())));

      sut.validateModel("any-model");
      sut.validateQtd(1);

      sut.saveItem();
    });
    test("should redirect to stocks page", () {
      sut.navigateToStream
          .listen(expectAsync1((value) => expect(value, "/stocks")));

      sut.saveAll();
    });
    test("should emit no error when validating model", () {
      sut.modelErrorStream.listen(expectAsync1((value) => expect(value, "")));
      sut.validateModel("valid-model");
    });
  });
}
