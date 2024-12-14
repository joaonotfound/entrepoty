import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:mobile_remote/domain/domain.dart';

Either<HttpErrorEnum, HttpResponse<R>> handleResponse<R>(Response response) {
  if (response.statusCode == 200) {
    return Either.right(HttpResponse(
      statuscode: response.statusCode,
      body: response.body.runtimeType == String
          ? json.decode(response.body)
          : response.body,
    ),);
  }
  switch (response.statusCode) {
    case 500:
      return Either.left(HttpErrorEnum.serverError);
    case 400:
      return Either.left(HttpErrorEnum.badRequest);
    case 401:
      return Either.left(HttpErrorEnum.unauthorized);
    case 403:
      return Either.left(HttpErrorEnum.forbidden);
    case 409:
      return Either.left(HttpErrorEnum.conflict);
    default:
      return Either.left(HttpErrorEnum.unexpected);
  }
}
