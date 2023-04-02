import '../../../domain/domain.dart';
import '../../ui.dart';

UiError fromDomain(DomainError error) {
  switch (error) {
    case DomainError.invalidCredentials:
      return UiError.invalidCredentials;
    case DomainError.accountDoesntExist:
      return UiError.accountDoesntExist;
    default:
      return UiError.unexpected;
  }
}
