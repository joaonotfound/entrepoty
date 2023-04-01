import 'package:entrepoty/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../infra/mocks/mocks.dart';

void main() {
  late GetxSignupPresenter sut;
  late MockValidation validator;
  setUp(() {
    validator = MockValidation();
    sut = GetxSignupPresenter(validation: validator);
  });
  group("GetxSignupPresenter", () {
    test("should call validator with correct value", () {
      sut.validateName("any-name");
      verify(() => validator.validate(field: "name", value: "any-name"));
    });
    test("should emit username error", () {
      sut.nameErrorStream
          .listen(expectAsync1((error) => expect(error, "any-error")));

      validator.mockValidate("any-error");
      sut.validateName('any-name');
    });
    test("should emit empty string if validators returns null", () {
      sut.nameErrorStream.listen(expectAsync1((error) => expect(error, "")));

      validator.mockValidate(null);
      sut.validateName('any-name');
    });
  });
}
