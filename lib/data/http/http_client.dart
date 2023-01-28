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
}

abstract class HttpClient {
  Future<HttpResponse<T>> get<T>({String url});
}
