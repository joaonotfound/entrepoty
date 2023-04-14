import 'package:fpdart/fpdart.dart';

class HttpResponse<T> {
  final int statuscode;
  final T? body;

  const HttpResponse({
    required this.statuscode,
    this.body,
  });
}

extension HttpResponseExtension on HttpResponse {
  Either<T, HttpResponse> toRight<T>() => Either.right(this);
  Either<HttpResponse, T> toLeft<T>() => Either.left(this);
}