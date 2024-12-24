import 'package:intl/intl.dart';

class AppFormatter{
  static String formatDate(DateTime? date){
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatCurrency(double amount){
    return NumberFormat.currency(locale: 'en_us',
        symbol: '\$').format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Check if the phone number is 10 digits long
    if (phoneNumber.length == 10) {
      // Format it as (XXX) XXX-XXXX
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    }
    // Check if the phone number is 11 digits long
    else if (phoneNumber.length == 11) {
      // Format it as +X (XXX) XXX-XXXX
      return '+${phoneNumber.substring(0, 1)} (${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }
    // If the phone number doesn't match the expected lengths, return an error message
    else {
      return 'Invalid phone number length';
    }
  }
}