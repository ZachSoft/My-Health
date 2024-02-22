class HttpExceptions implements Exception {
  HttpExceptions(this.statusCode);

  final int statusCode;

  String get message {
    switch (statusCode) {
      case 400:
        return "Network problem, try later.";
      case 401:
        return "Unauthorized. Please authenticate.";
      case 403:
        return "Forbidden. You don't have permission.";
      case 404:
        return "Not found. The requested resource does not exist.";
      case 500:
        return "Internal server error. Please try again later.";
      // Add more cases as needed for other status codes

      default:
        return "An unexpected error occurred. Please try again.";
    }
  }
}
