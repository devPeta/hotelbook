import 'package:cloud_firestore/cloud_firestore.dart';

class BookHotelProduct {
  final String imgPaths;
  final String name;
  final String location;
  final String price;
  final String description;
  final double latitude;
  final double longitude;
  final List<String> images;
  final String parentID;

  // Constructor
  const BookHotelProduct({
    required this.imgPaths,
    required this.price,
    required this.name,
    required this.location,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.images,
    this.parentID = '',
  });

  /// Helper Function: Create an empty `BookHotelProduct`
  factory BookHotelProduct.empty() {
    return const BookHotelProduct(
      imgPaths: '',
      price: '',
      name: '',
      location: '',
      description: '',
      latitude: 0.0,
      longitude: 0.0,
      images: [],
      parentID: '',
    );
  }

  /// Convert to JSON for Firebase storage
  Map<String, dynamic> toJson() {
    return {
      'imgPaths': imgPaths,
      'price': price,
      'name': name,
      'location': location,
      'description': description,
      'geoLocation': GeoPoint(latitude, longitude), // Store latitude & longitude as GeoPoint
      'images': images,
      'parentID': parentID,
    };
  }

  /// Create an object from JSON retrieved from Firebase
  factory BookHotelProduct.fromJson(Map<String, dynamic> json) {
    GeoPoint geoPoint = json['geoLocation'] as GeoPoint; // Extract GeoPoint
    return BookHotelProduct(
      imgPaths: json['ImgPaths'],
      price: json['Price'],
      name: json['Name'],
      location: json['Location'],
      description: json['Description'],
      latitude: geoPoint.latitude, // Get latitude from GeoPoint
      longitude: geoPoint.longitude, // Get longitude from GeoPoint
      images: List<String>.from(json['Images']), // Convert list to List<String>
      parentID: json['ParentID'] ?? '', // Default to empty if null
    );
  }
}
