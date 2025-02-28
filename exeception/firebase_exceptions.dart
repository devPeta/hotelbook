///custom exception class to handle various Firebase related error.
class TFirebaseExceptions implements Exception{
  ///Error code associated with the exception.
  final String code;

  ///constructor that takes the error code.
  TFirebaseExceptions(this.code);

  ///Get the corresponding error code based on the exceptions.
  String get message{
    switch (code){
      case 'captcha-check-failed':
        return 'The recaptcha response is invalid. Please try again.';
      case 'app-not-authorized':
        return 'This app is not authorized to used Firebase Authentication with the provided API Key.';
      case 'custom-token-mismatch':
        return 'The custom token correspond to a different audience.';
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again later.';
      case 'user-not-found':
        return 'No user found for the given email.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'wrong-password':
        return 'Incorrect password. Please check password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email already existed. Please use a different mail.';
      case 'provided-already-linked':
        return 'The account is already linked with another account.';
      case 'requires-recent-login':
        return 'This operations is sensitive and requires recent authentication. Please login again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credential do not correspond to the previously signed in user.';
      default:
        return 'An unexpected error occurred. Please try again later';
    }
  }
}