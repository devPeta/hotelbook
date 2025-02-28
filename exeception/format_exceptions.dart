///custom exception class to handle various Format related error.
class TFormatExceptions implements Exception{
  ///Error code associated with the exception.
  final String message;

  ///constructor that takes the error code.
  const TFormatExceptions([this.message = 'An unexpected format error occurred. Please check your input']);

  factory TFormatExceptions.fromMessage(String message){
    return TFormatExceptions(message);
  }

  String get formattedMessage => message;

  ///Get the corresponding error code based on the exceptions.
  factory TFormatExceptions.fromCode(String code){
    switch (code){
      case 'invalid-email-format':
        return const TFormatExceptions('The email address is invalid. Please enter a valid email address.');
      case 'invalid-phone number-format':
        return const TFormatExceptions('The provided phone number is invalid. Please enter a valid phone number.');
      case 'invalid-url-format':
        return const TFormatExceptions('The URL Format is invalid. Please enter a valid Date.');
      case 'invalid-number-format':
        return const TFormatExceptions('The Date Format is invalid. Please enter a valid URL.');
      case 'invalid-address-format':
        return const TFormatExceptions('The email address is invalid. Please enter a valid email address.');
      case 'invalid-credit-card-format':
        return const TFormatExceptions('The credit card details is invalid. Please enter a valid credit card details.');
      default:
        throw ArgumentError('Unknown error code: $code');
    }
  }
}