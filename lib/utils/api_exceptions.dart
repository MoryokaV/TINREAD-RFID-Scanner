class ApiException implements Exception {
  final String message;

  ApiException(this.message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super("UNAUTHORIZED");
}

class ServerException extends ApiException {
  ServerException([
    int? statusCode,
  ]) : super("INTERNAL SERVER ERROR: $statusCode");
}
