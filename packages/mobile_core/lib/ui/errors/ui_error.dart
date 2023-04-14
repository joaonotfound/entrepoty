enum UiError {
  requiredField,
  invalidField,
  invalidCredentials,
  unexpected,
  emailInUse,
  accountAlreadyExists,
  accountDoesntExist,
  connectionError
}

extension UiErrorExtension on UiError {
  String get description {
    switch (this) {
      case UiError.emailInUse:
        return "Email already in use.";
      case UiError.invalidCredentials:
        return "Invalid credencials.";
      case UiError.invalidField:
        return "Invalid field.";
      case UiError.requiredField:
        return "Required field.";
      case UiError.unexpected:
        return "Unexpected error.";
      case UiError.accountDoesntExist:
        return "Account doesn't exist.";
      case UiError.accountAlreadyExists:
        return "Account already exist.";
      case UiError.connectionError:
        return "Failed to connect to server.";
      default:
        return UiError.unexpected.description;
    }
  }
}
