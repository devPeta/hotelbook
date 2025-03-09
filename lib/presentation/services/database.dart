import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  Future addUserDetails(Map<String, dynamic> userCredential) async {
    return await FirebaseFirestore.instance
    .collection("users")
    .add(userCredential);
  }

  Future addUserBooking(Map<String, dynamic> userCredential) async {
    return await FirebaseFirestore.instance
    .collection("Booking")
    .add(userCredential);
  }

  ///Stream Builder For Collection of Document
  Future<Stream<QuerySnapshot>> getBookings() async {
      return await FirebaseFirestore.instance.collection("Booking").snapshots();
  }
}  