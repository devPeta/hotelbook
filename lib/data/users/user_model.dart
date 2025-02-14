import 'package:bookhotel/core/common/appformatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{

  ///User variables
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;


  ///Constructor for UserModel
  UserModel(
      {required  this.firstName,
        required this.lastName,
        required this.username,
        required this.email,
        required this.profilePicture,
        required this.id,
        required this.phoneNumber
      }
      );


  ///Helper Function
  String get fullName => '$firstName $lastName';

  ///Helper Function to format phone Number
  String get formattedPhoneNo => AppFormatter.formatPhoneNumber(phoneNumber);

  ///Static function to split name into first and Last Name.
  static List<String> nameParts(fullName) => fullName.split("");

  ///Static function to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "" ;

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwr_$camelCaseUsername";

    return usernameWithPrefix;
  }

  ///static function to create an empty user model.
  static UserModel empty() => UserModel(id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNumber:'',
    profilePicture:'',
  );

  ///Convert Model to Json Structure for storing data in Firebase
  Map<String, dynamic> toJson(){
    return {
      'FirstName': firstName,
      'LastName' : lastName,
      'Username' : username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }


  ///Factory method to create a UserModel from a document SnapShot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data()!= null){
      final data = document.data()!;
      return UserModel(
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        id: document.id,
        phoneNumber: data['PhoneNumber'] ?? '',
      );
    }else {
      // Handle the case where data is null
      throw Exception('Document data is null');
    }
  }

}




// class UserModel{
//
//   ///User variables
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String username;
//   final String email;
//   final String phoneNumber;
//   final String profilePicture;
//
//
//   ///Constructor for UserModel
//   UserModel(
//       {required  this.firstName,
//         required this.lastName,
//         required this.username,
//         required this.email,
//         required this.profilePicture,
//         required this.id,
//         required this.phoneNumber
//       }
//       );
//
//
//   ///Helper Function
//   String get fullName => '$firstName $lastName';
//
//   ///Helper Function to format phone Number
//   String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);
//
//   ///Static function to split name into first and Last Name.
//   static List<String> nameParts(fullName) => fullName.split("");
//
//   ///Static function to generate a username from the full name
//   static String generateUsername(fullName) {
//     List<String> nameParts = fullName.split("");
//     String firstName = nameParts[0].toLowerCase();
//     String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "" ;
//
//     String camelCaseUsername = "$firstName$lastName";
//     String usernameWithPrefix = "cwr_$camelCaseUsername";
//
//     return usernameWithPrefix;
//   }
//
//   ///static function to create an empty user model.
//   static UserModel empty() => UserModel(id: '',
//     firstName: '',
//     lastName: '',
//     username: '',
//     email: '',
//     phoneNumber:'',
//     profilePicture:'',
//   );
//
//   ///Convert Model to Json Structure for storing data in Firebase
//   Map<String, dynamic> toJson(){
//     return {
//       'FirstName': firstName,
//       'LastName' : lastName,
//       'Username' : username,
//       'Email': email,
//       'PhoneNumber': phoneNumber,
//       'ProfilePicture': profilePicture,
//     };
//   }
//
//
//   ///Factory method to create a UserModel from a document SnapShot
//   factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
//     if(document.data()!= null){
//       final data = document.data()!;
//       return UserModel(
//         firstName: data['FirstName'] ?? '',
//         lastName: data['LastName'] ?? '',
//         username: data['Username'] ?? '',
//         email: data['Email'] ?? '',
//         profilePicture: data['ProfilePicture'] ?? '',
//         id: document.id,
//         phoneNumber: data['PhoneNumber'] ?? '',
//       );
//     }else {
//       // Handle the case where data is null
//       throw Exception('Document data is null');
//     }
//   }
//
// }