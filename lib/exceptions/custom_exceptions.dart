class CustomException implements Exception {
  final _message;
  final _prefix;
  CustomException([this._prefix, this._message]);

  String toString() {
    return "$_prefix: $_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException(prefix, message) : super(prefix, message);
}

class BadRequestException extends CustomException {
  BadRequestException(prefix, message) : super(prefix, message);
}

class UnauthorisedException extends CustomException {
  UnauthorisedException(prefix, message) : super(prefix, message);
}

class InvalidInputException extends CustomException {
  InvalidInputException(prefix, message) : super(prefix, message);
}
