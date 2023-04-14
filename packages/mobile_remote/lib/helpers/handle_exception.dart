import 'dart:async';

import 'package:fpdart/fpdart.dart';

import '../domain/domain.dart';

Future<Either<HttpErrorEnum, HttpResponse<T>>> handleException<T>(Future<Either<HttpErrorEnum, HttpResponse<T>>> Function() function) async {
  try {
    return await function();
  } on TimeoutException catch (_){
    return Either.left(HttpErrorEnum.timeout);
  } catch (e) {
    return Either.left(HttpErrorEnum.unexpected);
  }
}
