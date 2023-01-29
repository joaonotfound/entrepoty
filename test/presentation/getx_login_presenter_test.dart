import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:service_desk_2/domain/domain.dart';
import 'package:service_desk_2/presentation/presentation.dart';
import 'package:service_desk_2/ui/screens/screens.dart';

import '../mocks/mocks.dart';

void main() {
  late LoginPresenter sut;
  late MockValidation validator;
  late MockAuthentication authentication;
  String id = faker.guid.guid();
  String password = faker.internet.password();
  setUp(() {
    validator = MockValidation();
    authentication = MockAuthentication();
    authentication.mockAuthenticate(
        const Account(id: "", name: "", profilePictureUrl: ""));
    sut = GetxLoginPresenter(
      validator: validator,
      authentication: authentication,
    );
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

  test("passwordErrorStream should not emit duplicated values", () {
    validator.mockValidate("error");

    sut.passwordErrorStream
        .listen(expectAsync1((error) => expect(error, "error")));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validatePassword(password);
    sut.validatePassword(password);
  });
  test("idErrorStream should not emit duplicated values", () {
    validator.mockValidate("error");

    sut.idErrorStream.listen(expectAsync1((error) => expect(error, "error")));
    sut.isFormValidStream
        .listen(expectAsync1((isValid) => expect(isValid, false)));

    sut.validateId(id);
    sut.validateId(id);
  });
  test('should call authentication with correct values', () {
    sut.validateId(id);
    sut.validatePassword(password);

    sut.authenticate();

    verify(
      () => authentication.authenticate(id: id, password: password),
    ).called(1);
  });
  test('should emit is loading stream', () {
    sut.validateId(id);
    sut.validatePassword(password);

    expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

    sut.authenticate();
  });

  test(
      "should emit correct main error if authenctation throws invalidCredentials",
      () {
    authentication.mockAuthenticateError(DomainError.invalidCredentials);
    sut.validateId(id);
    sut.validatePassword(password);

    sut.mainErrorStream.listen(
        expectAsync1((error) => expect(error, "Credenciais Inválidas.")));

    sut.authenticate();
  });
  test("should emit correct main error if authenctation throws unexpected", () {
    authentication.mockAuthenticateError(DomainError.unexpected);
    sut.validateId(id);
    sut.validatePassword(password);

    sut.mainErrorStream.listen(expectAsync1((error) =>
        expect(error, "Algo deu errado, tente novamente em breve.")));

    sut.authenticate();
  });
}