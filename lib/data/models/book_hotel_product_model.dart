class BookHotelProduct {
  final String imgPaths; // Consider renaming to `imagePaths` if it's a list
  final String title;
  final String location;
  final String price;
  final String description;
  final double latitude;
  final double longitude;
  final List<String> images;
  final String categoryId; // Make categoryId final

  /// Creates a [BookHotelProduct] instance.
  ///
  /// - [imgPaths]: The main image path or paths for the hotel.
  /// - [name]: The name of the hotel.
  /// - [title]: The title or tagline of the hotel.
  /// - [location]: The location of the hotel.
  /// - [price]: The price of the hotel stay.
  /// - [description]: A description of the hotel.
  /// - [latitude]: The latitude coordinate of the hotel.
  /// - [longitude]: The longitude coordinate of the hotel.
  /// - [images]: A list of additional images for the hotel.
  /// - [categoryId]: The category ID of the hotel (defaults to an empty string).
  const BookHotelProduct({
    required this.imgPaths,
    required this.title,
    required this.location,
    required this.price,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.images,
    this.categoryId = '', // Default categoryId is empty
  });

  /// Creates a copy of this [BookHotelProduct] with updated fields.
  ///
  /// - [imgPaths]: Updated image paths.
  /// - [name]: Updated name.
  /// - [title]: Updated title.
  /// - [location]: Updated location.
  /// - [price]: Updated price.
  /// - [description]: Updated description.
  /// - [latitude]: Updated latitude.
  /// - [longitude]: Updated longitude.
  /// - [images]: Updated images.
  /// - [categoryId]: Updated category ID.
  BookHotelProduct copyWith({
    String? imgPaths,
    String? title,
    String? location,
    String? price,
    String? description,
    double? latitude,
    double? longitude,
    List<String>? images,
    String? categoryId,
  }) {
    return BookHotelProduct(
      imgPaths: imgPaths ?? this.imgPaths,
      title: title ?? this.title,
      location: location ?? this.location,
      price: price ?? this.price,
      description: description ?? this.description,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      images: images ?? this.images,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  /// Creates a copy of this [BookHotelProduct] with a new [categoryId].
  ///
  /// - [category]: The new category ID.
  BookHotelProduct withCategoryId(String category) {
    return copyWith(categoryId: category);
  }
}

