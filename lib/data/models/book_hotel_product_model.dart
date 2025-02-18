class BookHotelProduct {
  final String imgPaths; // Consider renaming to `imagePaths` if it's a list
  final String title;
  final String location;
  final String price;
  final double basePrice;
  final String description;
  final double latitude;
  final double longitude;
  final List<String> images;
  final String categoryId; // Make categoryId final

  /// Creates a [BookHotelProduct] instance.
  const BookHotelProduct({
    required this.imgPaths,
    required this.title,
    required this.location,
    required this.basePrice,
    required this.price,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.images,
    this.categoryId = '', // Default categoryId is empty
  });

  /// Creates a copy of this [BookHotelProduct] with updated fields.
  BookHotelProduct copyWith({
    String? imgPaths,
    String? title,
    String? location,
    String? price,
    String? description,
    double? latitude,
    double? basePrice,
    double? longitude,
    List<String>? images,
    String? categoryId,
  }) {
    return BookHotelProduct(
      imgPaths: imgPaths ?? this.imgPaths,
      title: title ?? this.title,
      location: location ?? this.location,
      price: price ?? this.price,
      basePrice: basePrice ?? this.basePrice,
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

