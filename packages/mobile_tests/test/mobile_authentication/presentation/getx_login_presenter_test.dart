import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

import '../../mobile_core/mobile_core.dart';
import '../domain/domain.dart';

void main() {
  late GetxLoginPresenter sut;
  late MockValidation validator;
  late MockAuthentication authentication;
  late MockLocalSaveCurrentAccount saveCurrentAccount;

  Account validAccount =
      const Account(token: "", username: "", name: "", profilePictureUrl: "");
  String username = faker.internet.userName();
  String password = faker.internet.password();

  setUp(() {
    registerFallbackValue(validAccount);

    validator = MockValidation();

    saveCurrentAccount = MockLocalSaveCurrentAccount();
    saveCurrentAccount.mockSave(null);

    validator = MockValidation();
    authentication = MockAuthentication();
    authentication.mockAuthenticate(validAccount);

    sut = GetxLoginPresenter(
      validator: validator,
      authentication: authentication,
      saveCurrentAccount: saveCurrentAccount,
    );
  });

  group("GetxLoginPresenter", () {
    test("should call validate with correct values when validating id", () {
      sut.validateUsername(username);
      verify(() => validator.validate(field: "username", value: username))
          .called(1);
    });
    test("should call validate with correct values when validating password",
        () {
      sut.validatePassword(password);
      verify(() => validator.validate(field: "password", value: password))
          .called(1);
    });
    test("should emit error if id validation fails", () {
      validator.mockValidate("error");

      expectLater(sut.usernameErrorStream, emits("error"));

      sut.validateUsername(username);
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

      sut.usernameErrorStream
          .listen(expectAsync1((error) => expect(error, "error")));
      sut.isFormValidStream
          .listen(expectAsync1((isValid) => expect(isValid, false)));

      sut.validateUsername(username);
      sut.validateUsername(username);
    });
    test('should call authentication with correct values', () {
      sut.validateUsername(username);
      sut.validatePassword(password);

      sut.authenticate();

      verify(
        () =>
            authentication.authenticate(username: username, password: password),
      ).called(1);
    });

    test('should emit is loading stream', () {
      sut.validateUsername(username);
      sut.validatePassword(password);

      expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

      sut.authenticate();
    });
    test('should emit navigateToStream to stocks screen', () {
      sut.validateUsername(username);
      sut.validatePassword(password);

      sut.navigateToStream
          .listen(expectAsync1((page) => expect(page, Routes.home)));

      sut.authenticate();
    });

    test(
        "should emit correct main error if authenctation throws invalidCredentials",
        () {
      authentication.mockAuthenticateError(DomainError.unauthorized);
      sut.validateUsername(username);
      sut.validatePassword(password);

      sut.mainErrorStream.listen(
          expectAsync1((error) => expect(error, UiError.invalidCredentials)));

      sut.authenticate();
    });
    test("should emit correct main error if authentication throws unexpected",
        () {
      authentication.mockAuthenticateError(DomainError.unexpected);
      sut.validateUsername(username);
      sut.validatePassword(password);

      sut.mainErrorStream
          .listen(expectAsync1((error) => expect(error, UiError.unexpected)));

      sut.authenticate();
    });
    test(
        "should emit correct main error if saveCurrentAccount throws unexpected",
        () {
      saveCurrentAccount.mockSaveError(Exception());
      sut.validateUsername(username);
      sut.validatePassword(password);

      sut.mainErrorStream
          .listen(expectAsync1((error) => expect(error, UiError.unexpected)));

      sut.authenticate();
    });
  });
}
