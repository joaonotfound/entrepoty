import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mobile_authentication/mobile_authentication.dart';
import 'package:mobile_core/mobile_core.dart';
import 'package:mocktail/mocktail.dart';

import '../../mobile_core/mobile_core.dart';
import '../domain/mocks/mocks.dart';

void main() {
  late GetxSignupPresenter sut;
  late MockValidation validator;
  late SignupUsecaseMock usecase;
  late MockLocalSaveCurrentAccount saveCurrentAccount;
  final dummyAccount = Account(token: "", username: "", name: "", profilePictureUrl: "");
  setUp(() {
    validator = MockValidation();
    usecase = SignupUsecaseMock();
    usecase.mockSignup(Left(dummyAccount));
    saveCurrentAccount = MockLocalSaveCurrentAccount();
    saveCurrentAccount.mockSave(null);
    sut = GetxSignupPresenter(validation: validator, usecase: usecase, saveAccount: saveCurrentAccount);
  });
  setUpAll(() {
    registerFallbackValue(dummyAccount);
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
    test("should emit invalid when validator fails", () {
      sut.isFormValidStream
          .listen(expectAsync1((error) => expect(error, false)));

      validator.mockValidate("error");
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
    test("should emit invalid when validator fails", () {
      sut.isFormValidStream
          .listen(expectAsync1((error) => expect(error, false)));

      validator.mockValidate("error");
      sut.validateUsername('any-username');
    });
  });
  group("GetxSignupPresenter's password field", () {
    test("should call validator with correct value", () {
      sut.validatePassword("any-password");
      verify(
          () => validator.validate(field: "password", value: "any-password"));
    });
    test("should emit password error", () {
      sut.passwordErrorStream
          .listen(expectAsync1((error) => expect(error, "any-error")));

      validator.mockValidate("any-error");
      sut.validatePassword('any-password');
    });
    test("should emit empty string if validators returns null", () {
      sut.passwordErrorStream
          .listen(expectAsync1((error) => expect(error, "")));

      validator.mockValidate(null);
      sut.validatePassword('any-password');
    });
    test("should emit invalid when validator fails", () {
      sut.isFormValidStream
          .listen(expectAsync1((error) => expect(error, false)));

      validator.mockValidate("error");
      sut.validatePassword('any-password');
    });
  });
  group("GetxSignupPresenter create account", () {
    test("should call save current account on success", () async {
      final account = Account(token: "any-token", username: "any-username", name: "any-name", profilePictureUrl: "any-pf-url");
      usecase.mockSignup(Left(account));
      saveCurrentAccount.mockSave(null);

      await sut.signup();

      verify(() => saveCurrentAccount.saveAccount(account: account)).called(1);
    });
    test("should redirect to home on success", () async {
      sut.navigateToStream.listen(expectAsync1((route) => expect(route, Routes.home)));

      await sut.signup();
    });

    test("should emit correct error if signup fails", () async {
      usecase.mockSignup(Right(DomainError.serverError));
      sut.mainErrorStream.listen(expectAsync1((error) => expect(error, UiError.unexpected)));

      await sut.signup();
    });
    test('should emit is loading', () async {

      expectLater(sut.isLoadingStream, emitsInOrder([true, false]));

      await sut.signup();
    });
    test("should emit unexpected error if anything throws", () async {
      usecase.mockSignupCall().thenThrow(Error);

      sut.mainErrorStream.listen(expectAsync1((error) => expect(error, UiError.unexpected)));

      await sut.signup();
    });
  });
}
