import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  static final _box = GetStorage();

  static const String userIdKey = "USERKEY";
  static const String userNameKey = "USERNAMEKEY";
  static const String userEmailKey = "USEREMAILKEY";
  static const String userImageKey = "USERIMAGEKEY";

  static Future<void> saveUserID(String userID) async {
    await _box.write(userIdKey, userID);
  }

  static Future<void> saveUserName(String userName) async {
    await _box.write(userNameKey, userName);
  }

  static Future<void> saveUserEmail(String userEmail) async {
    await _box.write(userEmailKey, userEmail);
  }

  static Future<void> saveUserImage(String userImage) async {
    await _box.write(userImageKey, userImage);
  }

  static String? getUserID() => _box.read(userIdKey);
  static String? getUserName() => _box.read(userNameKey);
  static String? getUserEmail() => _box.read(userEmailKey);
  static String? getUserImage() => _box.read(userImageKey);
}
