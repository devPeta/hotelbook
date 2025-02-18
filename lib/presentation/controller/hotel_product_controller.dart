import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:get/get.dart';

class HotelProductController extends GetxController {
  /// List of the Products or Hotels
  RxList<BookHotelProduct> bookHotel = <BookHotelProduct>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeHotelProducts(); // Initialize list of hotels when the controller is initialized
    separateCategories(); // Separate categories when the controller is initialized
  }

  /// Method to initialize the list of hotels
  void _initializeHotelProducts() {
    bookHotel.addAll([
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png',
      title: 'Top Galaxy Hotel',
      location: 'Sabon Tasha',
      price: '#35,000',
      basePrice: 35000,
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg'
      ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png',  location: 'Sabon Tasha', price: '#15,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      title: 'Palm Palace Hotel',
      basePrice: 15000,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(
      imgPaths: 'assets/images/hotel/hotel1.png',  location: 'Kaduna North', price: '#40,000',
      title: 'Star Hotel',
      basePrice: 40000,
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', title: 'Raw Hotel', location: 'Ungwan Rimi', price: '#25,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125,
      basePrice: 25000,
      longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png',
      title: 'Royal Hotel',
      location: 'Trikiana', price: '#55,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793, basePrice: 55000,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png',
      title:'Goshen Hotel',
      location: 'Ungwan Pama', price: '#25,000',basePrice: 25000,
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png',
      title:'Equatorial Hotel',
      location: 'Kaduna North', price: '#75,000', basePrice: 75000,
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png',
      title:'Protect Hotel',location: 'Romi', price: '#25,000',basePrice: 25000,
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ).withCategoryId('places_around'),

    const BookHotelProduct(
      imgPaths: 'assets/images/hotel/place3.png', title: 'Kaduna Museum',
      images: [
        'assets/images/places/m1.jpg', 'assets/images/places/m2.jpg', 'assets/images/places/m3.jpg'
      ],
      description: 'The Kaduna Museum houses a substantial\ncollection of archaeological, ethnographic, \nand craft exhibits.',
      latitude: 10.5076,
      longitude: 7.4364790,
      price: '#35,000',basePrice: 35000,
      location: 'Ali Akilu Road, U/ Sarki',
    ).withCategoryId('visit_around'),
    const BookHotelProduct(
      imgPaths: 'assets/images/hotel/place2.png',
      title: 'Kagoro Hills',
      images: [

        'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg'
      ],
      description: 'Kagoro Hills is a stunning natural landmark\nlocated in southern Kaduna State, Nigeria, near the \ntown of kagoro in Kaura LGA.',
      latitude: 9.5816,
      longitude: 8.47298, basePrice: 25000,
      price: '#25,000',
      location: 'Southern Kaduna, Kaura LGA',
    ).withCategoryId('visit_around'),
    const BookHotelProduct(
      imgPaths: 'assets/images/hotel/place2.png', title: 'Kajuru Castle',
      images: [
        'assets/images/places/2.jpg', 'assets/images/places/3.jpg', 'assets/images/places/6.jpg',
      ],
      description: 'Kajuru Castle is a unique medieval-style villa \nlocated in Kajuru Local Government Area, \nKaduna State, Nigeria.',
      latitude: 10.3125,
      longitude: 7.6793,
      price: '#25,000',
      basePrice: 25000,
      location: 'kajuru LGA, Kaduna South',
    ).withCategoryId('visit_around'),
    ]);
  }

  /// Selected Product
  var selectedProduct = Rxn<BookHotelProduct>();

  /// Separate the categories into two lists
  RxList<BookHotelProduct> placesAround = <BookHotelProduct>[].obs;
  RxList<BookHotelProduct> visitAround = <BookHotelProduct>[].obs;

  void separateCategories() {
    placesAround.value = bookHotel.where((product) => product.categoryId == 'places_around').toList();
    visitAround.value = bookHotel.where((product) => product.categoryId == 'visit_around').toList();
  }

  /// Method to select product
  void selectProduct(BookHotelProduct product) {
    selectedProduct.value = product;
  }

  /// Tracks press state for buttons
  var isPressed = false.obs;
  RxBool isImageLoaded = false.obs;

  /// Simulate image loading
  void loadImage() async {
    await Future.delayed(const Duration(seconds: 2));
    isImageLoaded.value = true;
  }

  /// Function to simulate image loading (or replace with actual logic)
  Future<void> simulateImageLoading() async {
    isImageLoaded.value = false; // Reset loading state
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay
    isImageLoaded.value = true; // Set as loaded after delay
  }

}