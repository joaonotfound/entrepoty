import 'package:fpdart/fpdart.dart';
import 'package:mobile_core/mobile_core.dart';

import '../domain.dart';

abstract class HttpClient {
  Future<HttpResponse<T>> delete<T>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  });

  Future<HttpResponse<T>> get<T>({
    required String url,
    Map? headers,
    Duration? timeout,
  });

  Future<HttpResponse<T>> post<T>({
    required String url,
    Map? body,
    Map? headers,
    Duration? timeout,
  });

  Future<Either<DomainError, HttpResponse<T>>> multiples<T>({
    required String method,
    required String url,
    List<MultipleData>? data,
    List<MultipleFile>? files,
  });
}
