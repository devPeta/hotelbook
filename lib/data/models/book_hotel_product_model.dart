
class BookHotelProduct{
      final String imgPaths;
      final String name;
      final String location;
      final String price;
      final String description;
      final double latitude;
      final double longitude;
      final List<String> images;


  const BookHotelProduct( {
      required this.imgPaths,
      required this.price,
      required this.name,
      required this.location,
      required this.description,
      required this.latitude,
      required this.longitude,
      required this.images,
  });

      String get productImgPaths => imgPaths;
      String get productHotelName => name;
      String get productHotelLocation => location;
      String get productPrice => price;
}