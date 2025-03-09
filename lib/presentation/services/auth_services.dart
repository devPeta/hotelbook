import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> loginAdmin(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user exists in the "admins" collection
      DocumentSnapshot adminDoc =
          await _firestore.collection('admins').doc(userCredential.user!.uid).get();

      if (adminDoc.exists) {
        return userCredential.user;
      } else {
        await _auth.signOut();
        throw "Access Denied: You are not an admin";
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
