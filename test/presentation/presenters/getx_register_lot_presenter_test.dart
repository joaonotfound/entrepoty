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
  });
}
