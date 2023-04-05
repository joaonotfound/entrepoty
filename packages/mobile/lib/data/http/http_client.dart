import 'package:entrepoty/domain/domain.dart';
import 'package:fpdart/fpdart.dart';

class HttpResponse<T> {
  final int statuscode;
  final T? body;

  const HttpResponse({
    required this.statuscode,
    this.body,
  });
}

enum HttpError {
  badRequest,
  unauthorized,
  serverError,
  unexpected,
}

class MultipleData {
  String name;
  String content;

  MultipleData({required this.name, required this.content});
}

class MultipleFile {
  String name;
  String filePath;

  MultipleFile({required this.name, required this.filePath});
}

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
