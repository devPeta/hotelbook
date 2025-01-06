import 'package:bookhotel/presentation/views/mains/homepage/places_around_page.dart';
import 'package:get/get.dart';

class VisitAroundModel{
  final String imgPaths;
  final String title;
  final String address;
  final String description;
  final double latitude;
  final double longitude;
  final List<String> images;

  VisitAroundModel({
    required this.imgPaths,
    required this.title,
    required this.address,
    required this.description,
    required this.images,
    required this.latitude,
    required this.longitude,
  });

  ///Mapping from API
  String get visitImgPaths => imgPaths;
  String get visitTitle => title;

  ///Navigation to PlacesAroundPage
  void onTap(){
    Get.to(()=> PlacesAroundPage( visitAroundModel: this),);
  }

  ///Navigate too Booking Screen
  void onTapBooking(){
    Get.to(()=> PlacesAroundPage( visitAroundModel: this),);
  }


}