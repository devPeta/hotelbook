import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var fullName = "".obs;
  var address = "".obs;
  var idNumber = "".obs;
  var email = "".obs;
  var phoneNumber = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  /// ✅ Fetch User Data from Firestore
  Future<void> fetchUserData() async {
    try {
      String uid = auth.currentUser!.uid;
      DocumentSnapshot userDoc =
      await firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        fullName.value = "${userDoc['firstName']} ${userDoc['lastName']}";
        address.value = userDoc['address'] ?? 'Not Set';
        idNumber.value = userDoc['idNumber'] ?? 'Not Set';
        email.value = userDoc['email'];
        phoneNumber.value = userDoc['phoneNumber'] ?? 'Not Set';
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }
}
