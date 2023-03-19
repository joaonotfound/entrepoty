enum DomainError {
  unexpected,
  invalidCredentials,
  serverError,
  networkError,
}

extension DomainErrorExtension on DomainError {
  String get description {
    switch (this) {
      case DomainError.invalidCredentials:
        return "Credenciais Inválidas.";
      default:
        return "Algo deu errado, tente novamente em breve.";
    }
  }
}
