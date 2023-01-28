import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/presentation/presenters/stream_login_presenter.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

import '../data/mocks/validation_mock.dart';

void main() {
  late LoginPresenter sut;
  late MockValidation validator;
  String id = faker.guid.guid();
  String password = faker.internet.password();
  setUp(() {
    validator = MockValidation();
    sut = StreamLoginPresenter(validator: validator);
  });
  test("should call validate with correct values when validating id", () {
    sut.validateId(id);
    verify(() => validator.validate(field: "id", value: id)).called(1);
  });
  test("should call validate with correct values when validating password", () {
    sut.validatePassword(password);
    verify(() => validator.validate(field: "password", value: password))
        .called(1);
  });
  test("should emit error if id validation fails", () {
    validator.mockValidate("error");

    expectLater(sut.idErrorStream, emits("error"));

    sut.validateId(id);
  });

  test("should emit error if password validation fails", () {
    validator.mockValidate("error");

    expectLater(sut.passwordErrorStream, emits("error"));

    sut.validatePassword(password);
  });

  test("idErrorStream should not emit duplicated values", () {
    validator.mockValidate("error");

    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, "error")));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });
}
