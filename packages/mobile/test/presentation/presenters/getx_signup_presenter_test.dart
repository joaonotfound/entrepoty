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
  group("GetxSignupPresenter's name field", () {
    test("should call validator with correct value", () {
      sut.validateName("any-name");
      verify(() => validator.validate(field: "name", value: "any-name"));
    });
    test("should emit name error", () {
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
  group("GetxSignupPresenter's username field", () {
    test("should call validator with correct value", () {
      sut.validateUsername("any-username");
      verify(
          () => validator.validate(field: "username", value: "any-username"));
    });
    test("should emit username error", () {
      sut.usernameErrorStream
          .listen(expectAsync1((error) => expect(error, "any-error")));

      validator.mockValidate("any-error");
      sut.validateUsername('any-username');
    });
    test("should emit empty string if validators returns null", () {
      sut.usernameErrorStream
          .listen(expectAsync1((error) => expect(error, "")));

      validator.mockValidate(null);
      sut.validateUsername('any-username');
    });
  });
}
