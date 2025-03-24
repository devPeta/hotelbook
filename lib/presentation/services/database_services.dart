import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{

  // Future addUserDetails(Map<String, dynamic> userCredential) async {
  //   return await FirebaseFirestore.instance
  //   .collection("users")
  //   .add(userCredential);
  // }

  Future addUserBooking(Map<String, dynamic> userCredential) async {
    return await FirebaseFirestore.instance
    .collection("Booking")
    .add(userCredential);
  }

  Future<void> addHotel(BookHotelProduct hotel) async {
    final hotelRef = FirebaseFirestore.instance.collection('hotels').doc();

    await hotelRef.set(hotel.toFirestore());
  }

  Future<List<BookHotelProduct>> fetchHotels() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('hotels')
        .orderBy('createdAt', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => BookHotelProduct.fromFirestore(doc)).toList();
  }

  Future<void> updateHotel(String hotelId, BookHotelProduct updatedHotel) async {
    await FirebaseFirestore.instance
        .collection('hotels')
        .doc(hotelId)
        .update(updatedHotel.toFirestore());
  }

  Future<void> deleteHotel(String hotelId) async {
    await FirebaseFirestore.instance.collection('hotels').doc(hotelId).delete();
  }

  ///Stream Builder For Collection of Document
  Future<Stream<QuerySnapshot>> getBookings() async {
      return await FirebaseFirestore.instance.collection("Booking").snapshots();
  }
}  