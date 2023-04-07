enum DomainError {
  unexpected,
  invalidCredentials,
  serverError,
  networkError,
  accountAlreadyExists,
  accountDoesntExist,
}

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return "Invalid Credentials";
      case DomainError.accountDoesntExist:
        return "Account doesn't exist";
      default:
        return "Algo deu errado, tente novamente em breve.";
    }
  }
}
