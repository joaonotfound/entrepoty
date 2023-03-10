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

abstract class HttpClient {
  Future<HttpResponse<T>> get<T>({required String url});
  Future<HttpResponse<T>> post<T>({required String url, Map body});
}
