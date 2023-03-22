import '../../domain/domain.dart';
import '../ui.dart';

UiError fromDomain(DomainError error) {
  switch (error) {
    case DomainError.invalidCredentials:
      return UiError.invalidCredentials;
    default:
      return UiError.unexpected;
  }
}
