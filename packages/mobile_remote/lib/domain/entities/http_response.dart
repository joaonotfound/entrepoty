class HttpResponse<T> {
  final int statuscode;
  final T? body;

  const HttpResponse({
    required this.statuscode,
    this.body,
  });
}
