import 'package:mobile_core/domain/domain.dart';

import 'errors/errors.dart';

UiError fromDomain(DomainError error) {
  switch (error) {
    case DomainError.invalidCredentials:
      return UiError.invalidCredentials;
    case DomainError.accountDoesntExist:
      return UiError.accountDoesntExist;
    case DomainError.accountAlreadyExists:
      return UiError.accountAlreadyExists;
    default:
      return UiError.unexpected;
  }
}
