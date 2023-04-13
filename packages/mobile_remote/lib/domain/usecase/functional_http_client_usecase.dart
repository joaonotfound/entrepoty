import 'package:fpdart/fpdart.dart';
import 'package:mobile_remote/domain/domain.dart';

abstract class FunctionalHttpClientUsecase {
  Future<Either<HttpError, HttpResponse<R>>> delete<R>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  });

  Future<Either<HttpError, HttpResponse<R>>> get<R>({
    required String url,
    Map? headers,
    Duration? timeout,
  });

  Future<Either<HttpError, HttpResponse<R>>> post<R>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  });

  Future<Either<HttpError, HttpResponse<T>>> multiples<T>({
    required String method,
    required String url,
    List<MultipleData>? data,
    List<MultipleFile>? files,
  });
}
