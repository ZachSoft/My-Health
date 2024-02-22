class TfirebaseException implements Exception {
  final String code;
  TfirebaseException(this.code);

  String get message {
    switch (code) {
      // FirebaseAuth exceptions (User-related)
      case 'user-not-found':
        return "User not found. Please check your credentials.";
      case 'wrong-password':
        return "Wrong password. Please try again.";
      case 'email-already-in-use':
        return "Email address is already in use. Please choose another one.";
      case 'operation-not-allowed':
        return "Operation not allowed. Please contact support.";
      case 'weak-password':
        return "Password is too weak. Please choose a stronger one.";
      case 'user-disabled':
        return "This user account has been disabled, contact support.";
      case 'invalid-verification-code':
        return "Invalid verification code. Please check and try again.";
      case 'invalid-verification-id':
        return "Invalid verification ID. Please check and try again.";
      case 'phone-number-already-in-use':
        return "Phone number is already in use. Please choose another one.";
      case 'credential-already-in-use':
        return "Credential is already in use by another account.";
      case 'missing-phone-number':
        return "Phone number is required for the operation.";
      case 'account-exists-with-different-credential':
        return "An account already exists with the same email address but different credentials.";
      case 'requires-recent-login':
        return "Action requires recent login. Please sign in again.";
      case 'user-mismatch':
        return "User mismatch. The provided credential does not match the existing user.";
      case 'invalid-user-token':
        return "Invalid user token. Please sign in again.";
      case 'user-token-expired':
        return "User token has expired. Please sign in again.";
      case 'web-storage-unsupported':
        return "Web storage is not supported by the current browser.";
      case 'cancelled':
        return "The operation was cancelled.";
      case 'unknown':
        return "An unknown error occurred.";
      case 'invalid-argument':
        return "Invalid argument provided.";
      case 'deadline-exceeded':
        return "The operation timed out.";
      case 'not-found':
        return "The requested document or resource was not found.";
      case 'already-exists':
        return "The document or resource already exists.";
      case 'permission-denied':
        return "Permission denied. Check your security rules.";
      case 'unauthenticated':
        return "User is not authenticated. Sign in to perform this operation.";

      // Realtime Database exceptions
      case 'datastale':
        return "The data is stale and may no longer be accurate.";
      case 'overridden-by-set':
        return "The transaction was overridden by a subsequent set.";
      case 'transaction-aborted':
        return "The transaction was aborted.";
      case 'network-error':
        return "A network error occurred.";

      // Cloud Functions exceptions
      case 'cancelled':
        return "The operation was cancelled.";
      case 'invalid-argument':
        return "Invalid argument provided.";
      case 'deadline-exceeded':
        return "The operation timed out.";
      case 'not-found':
        return "The requested function or resource was not found.";
      case 'already-exists':
        return "The function or resource already exists.";
      case 'permission-denied':
        return "Permission denied. Check your function permissions.";
      case 'unauthenticated':
        return "User is not authenticated. Sign in to perform this operation.";
      case 'resource-exhausted':
        return "Resource exhausted. Consider optimizing your function.";

      // Add more cases for other Firebase exceptions as needed

      default:
        return "An unexpected error occurred. Please try again.";
    }
  }
}
