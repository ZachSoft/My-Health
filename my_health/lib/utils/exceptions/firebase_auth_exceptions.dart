class TFirebaseAuthExceptions implements Exception {
  TFirebaseAuthExceptions(this.code);
  String code;

  String get message {
    switch (code) {
      case 'invalid-email':
        return "Invalid email address.";
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
      case 'network-request-failed':
        return "Network request failed. Please check your internet connection.";
      case 'too-many-requests':
        return "Too many requests. Please try again later.";
      case 'app-not-authorized':
        return "App not authorized to use Firebase Authentication.";
      case 'user-disabled':
        return "This user account has been disabled.";
      case 'invalid-verification-code':
        return "Invalid verification code. Please check and try again.";
      case 'invalid-verification-id':
        return "Invalid verification ID. Please check and try again.";
      case 'phone-number-already-in-use':
        return "Phone number is already in use. Please choose another one.";
      case 'quota-exceeded':
        return "Firebase quota exceeded. Please contact support.";
      case 'provider-already-linked':
        return "Provider is already linked to another account.";
      case 'credential-already-in-use':
        return "Credential is already in use by another account.";
      case 'missing-phone-number':
        return "Phone number is required for the operation.";
      case 'popup-closed-by-user':
        return "Popup closed by user. Please try again.";
      case 'account-exists-with-different-credential':
        return "An account already exists with the same email address but different credentials.";
      case 'invalid-api-key':
        return "Invalid API key. Please check your Firebase project settings.";
      case 'web-storage-unsupported':
        return "Web storage is not supported by the current browser.";
      case 'app-not-registered':
        return "App not registered with Firebase. Check your configuration.";
      case 'missing-app-credential':
        return "Missing app credential. Check your Firebase project settings.";
      case 'invalid-user-token':
        return "Invalid user token. Please sign in again.";
      case 'invalid-continue-uri':
        return "Invalid continue URI. Check your deep link configuration.";
      case 'unauthorized-domain':
        return "Unauthorized domain. Add your domain to the authorized domains list in Firebase.";
      case 'invalid-credential':
        return "Invalid credential. Please sign in again.";
      case 'requires-recent-login':
        return "Action requires recent login. Please sign in again.";
      case 'email-already-exists':
        return "Email address already exists. Please choose another one.";
      case 'invalid-tenant-id':
        return "Invalid tenant ID. Please check your Firebase project settings.";
      case 'user-mismatch':
        return "User mismatch. The provided credential does not match the existing user.";
      case 'operation-not-supported-in-this-environment':
        return "Operation not supported in this environment.";
      case 'invalid-message-payload':
        return "Invalid message payload. Check your FCM message format.";
      case 'invalid-recipient-email':
        return "Invalid recipient email. Please check and try again.";
      case 'user-token-expired':
        return "User token has expired. Please sign in again.";
      case 'invalid-action-code':
        return "Invalid action code. Please check your email for a valid link.";
      default:
        return "An unexpected error occurred. Please try again.";
    }
  }
}
