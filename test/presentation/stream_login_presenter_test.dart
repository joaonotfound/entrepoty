import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/presentation/presenters/stream_login_presenter.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

import '../data/mocks/validation_mock.dart';

void main() {
  late LoginPresenter loginPresenter;
  late MockValidation validator;
  String id = faker.guid.guid();
  String password = faker.internet.password();
  setUp(() {
    validator = MockValidation();
    loginPresenter = StreamLoginPresenter(validator: validator);
  });
  test("should call validate with correct values when validating id", () {
    loginPresenter.validateId(id);
    verify(() => validator.validate(field: "id", value: id)).called(1);
  });
  test("should call validate with correct values when validating password", () {
    loginPresenter.validatePassword(password);
    verify(() => validator.validate(field: "password", value: password))
        .called(1);
  });
  test("should emit error if id validation fails", () {
    validator.mockValidate("error");

    expectLater(loginPresenter.idErrorStream, emits("error"));

    loginPresenter.validateId(id);
  });

  test("should emit error if password validation fails", () {
    validator.mockValidate("error");

    expectLater(loginPresenter.passwordErrorStream, emits("error"));

    loginPresenter.validatePassword(password);
  });
}
