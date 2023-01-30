import 'package:flutter_test/flutter_test.dart';
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
    test("should emit no error when validating model", () {
      sut.modelErrorStream.listen(expectAsync1((value) => expect(value, "")));
      sut.validateModel("valid-model");
    });
  });
}
