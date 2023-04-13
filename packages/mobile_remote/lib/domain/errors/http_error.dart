enum HttpErrorEnum {
// Client Errors
  badRequest,
  unauthorized,
  forbidden,
  conflict,

  // Server Errors
  serverError,
  unexpected,
  timeout
}

class HttpError {
  HttpErrorEnum error;
  int statuscode;
  Map? body;

  HttpError({
    required this.error,
    required this.statuscode,
    this.body
  });
}
