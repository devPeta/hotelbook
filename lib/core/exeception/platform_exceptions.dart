///custom exception class to handle various Platform related error.
class TPlatformExceptions implements Exception{

  final String message;

  TPlatformExceptions(this.message);

  String get errorMessage{
    switch (message){
      case 'captcha-check-failed':
        return 'The recaptcha response is invalid. Please try again.';
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again later.';
      case 'session-cooked-expired':
        return 'The firebase cookie has expired. Please sign in later';
      case 'internal-error':
        return 'Please try again later.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      default:
        return 'An unexpected error occurred. Please try again later';
    }
  }
}