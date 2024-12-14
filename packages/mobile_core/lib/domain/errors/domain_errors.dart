import 'package:fpdart/fpdart.dart';

enum DomainError {
  unexpected,
  unauthorized,
  serverError,
  networkError,
  conflict,
  notFound,
}

extension DomainErrorExtension on DomainError {
  Either<DomainError, T> toLeft<T>() => Either.left(this);

  String get description {
    switch (this) {
      case DomainError.unauthorized:
        return 'Unauthorized';
      case DomainError.notFound:
        return 'Not found';
      default:
        return 'Something went wrong, please try again later.';
    }
  }
}
