import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/domain/domain.dart';

enum HttpErrorEnum {
// Client Errors
  badRequest,
  unauthorized,
  forbidden,
  conflict,
  notfound,

  // Server Errors
  serverError,
  unexpected,
  timeout
}

extension HttpErrorEnumExtension on HttpErrorEnum {
  Either<DomainError, T> asDomainErrorEither<T>() => Either.left(asDomainError);
  Either<T, DomainError> asDomainErrorEitherOnRight<T>() => Either.right(asDomainError);

  Either<HttpErrorEnum, T> toLeft<T>() => Either.left(this);

  DomainError get asDomainError {
    switch(this){
      case HttpErrorEnum.unauthorized:
        return DomainError.unauthorized;
      case HttpErrorEnum.serverError:
        return DomainError.serverError;
      case HttpErrorEnum.timeout:
        return DomainError.networkError;
      case HttpErrorEnum.conflict:
        return DomainError.conflict;
      case HttpErrorEnum.forbidden:
        return DomainError.unauthorized;
      default:
        return DomainError.unexpected;
    }
  }
}

class HttpError {
  HttpErrorEnum error;
  int statuscode;
  Map? body;

  HttpError({
    required this.error,
    required this.statuscode,
    this.body
  });
}
