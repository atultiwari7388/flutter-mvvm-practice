class AppException implements Exception {
  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String toString() {
    return "$_prefix $_message";
  }
}

//for fetching data from the server
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

//for parsing data from the server
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid request ");
}

//for token validation

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, "Unauthorised requested");
}

//for invalid input
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid input");
}
