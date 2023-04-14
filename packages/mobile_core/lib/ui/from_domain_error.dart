import 'package:mobile_core/domain/domain.dart';

import 'errors/errors.dart';

UiError fromDomain(DomainError error) {
  switch (error) {
    case DomainError.unauthorized:
      return UiError.invalidCredentials;
    case DomainError.notFound:
      return UiError.accountDoesntExist;
    case DomainError.conflict:
      return UiError.accountAlreadyExists;
    case DomainError.networkError:
      return UiError.connectionError;
    default:
      return UiError.unexpected;
  }
}
