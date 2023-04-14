import 'package:fpdart/fpdart.dart';
import 'package:mobile_remote/domain/domain.dart';

abstract class FunctionalHttpClientUsecase {
  Future<Either<HttpErrorEnum, HttpResponse<R>>> delete<R>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  });

  Future<Either<HttpErrorEnum, HttpResponse<R>>> get<R>({
    required String url,
    Map? headers,
    Duration? timeout,
  });

  Future<Either<HttpErrorEnum, HttpResponse<R>>> post<R>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  });

  Future<Either<HttpErrorEnum, HttpResponse<T>>> multiples<T>({
    required String method,
    required String url,
    List<MultipleData>? data,
    List<MultipleFile>? files,
  });
}
