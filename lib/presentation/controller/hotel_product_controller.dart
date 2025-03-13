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
    const BookHotelProduct(imgPaths: 'assets/images/hotel/h2.jpg',
      title: 'Top Galaxy Hotel',
      location: 'Sabon Tasha',
      price: '#3500',
      basePrice: 3500,
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/hotel/h2.jpg', 'assets/images/hotel/h3.jpg','assets/images/hotel/h4.jpg'
      ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(
      imgPaths: 'assets/images/hotel/h4a.jpg',  location: 'Kaduna North', price: '#4000',
      title: 'Star Hotel',
      basePrice: 4000,
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/hotel/h4a.jpg', 'assets/images/hotel/h4b.jpg', 'assets/images/hotel/h4.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/h5a.jpg', title: 'Raw Hotel', location: 'Ungwan Rimi', price: '#6000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125,
      basePrice: 6000,
      longitude: 7.6793,
      images: [ 'assets/images/hotel/h5b.jpg', 'assets/images/hotel/h5c.jpg', 'assets/images/hotel/h5a.jpg' ],
    ).withCategoryId('places_around'),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hh1.jpg',
      title: 'Royal Hotel',
      location: 'Trikiana', price: '#5500',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793, basePrice: 5500,
      images: [ 'assets/images/hotel/hh1.jpg', 'assets/images/hotel/hh2.jpg', 'assets/images/hotel/hh3.jpg' ],
    ).withCategoryId('places_around'),

    const BookHotelProduct(
      imgPaths: 'assets/images/places/m1.jpg', title: 'Kaduna Museum',
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
      imgPaths: 'assets/images/places/place2.png',
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
      imgPaths: 'assets/images/places/kk2.jpg',
      title: 'Kamuku Park',
      images: [
        'assets/images/places/kk1.jpg', 'assets/images/places/kk2.jpg', 'assets/images/places/kk3.jpg'
      ],
      description: 'The park is home to a diverse range of wildlife\nincluding elephants, antelopes, oribi, waterbucks,\nwildcats, green monkeys, side-striped hyenas, and jackals.',
      latitude: 10.7,
      longitude: 6.5, basePrice: 25000,
      price: '#25,000',
      location: 'Birnin Gwari, Kaduna',
    ).withCategoryId('visit_around'),

      const BookHotelProduct(
      imgPaths: 'assets/images/places/matsirawaterfall1.jpg',
      title: 'Matsirga Waterfalls',
      images: [
        'assets/images/places/matsirawaterfall1.jpg', 'assets/images/places/matsirawaterfall2.jpg', 'assets/images/places/matsirawaterfall3.jpg'
      ],
      description: 'Matsirga Waterfalls, also known as "River Wonderful," \nis a stunning natural attraction located in Batadon (Madakiya),\na small settlement near Kafanchan in southern Kaduna State, Nigeria.',
      latitude: 9.6,
      longitude: 8.312, basePrice: 25000,
      price: '#25,000',
      location: 'Birnin Gwari, Kaduna',
    ).withCategoryId('visit_around'),

    const BookHotelProduct(
      imgPaths: 'assets/images/places/zazzau1.jpg',
      title: 'Zazzau Emir Palace',
      images: [
        'assets/images/places/zazzau1.jpg', 'assets/images/places/zazzau2.jpg', 'assets/images/places/zazzau3.jpg'
      ],
      description: 'Kagoro Hills is a stunning natural landmark\nlocated in southern Kaduna State, Nigeria, near the \ntown of kagoro in Kaura LGA.',
      latitude: 9.5816,
      longitude: 8.47298, basePrice: 25000,
      price: '#25,000',
      location: 'Zaria, Kaduna LGA',
    ).withCategoryId('visit_around'),
    
    const BookHotelProduct(
      imgPaths: 'assets/images/hotel/place2.png', title: 'Kajuru Castle',
      images: [
        'assets/images/places/castle1.jpg', 'assets/images/places/castle2.jpg', 'assets/images/places/castle3.jpg',
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