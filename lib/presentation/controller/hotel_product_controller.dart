import 'package:bookhotel/data/models/book_hotel_product_model.dart';
import 'package:get/get.dart';


class HotelProductController extends GetxController {

  ///List Of the Products Or Hotel around
  RxList<BookHotelProduct> bookHotel = <BookHotelProduct> [
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png',
      name: 'Top Galaxy Hotel',
      location: 'Sabon Tasha',
      price: '#35,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg'
      ],
    ),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Palm Palace Hotel', location: 'Sabon Tasha', price: '#15,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', name: 'Star Hotel', location: 'Kaduna North', price: '#40,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Raw Hotel', location: 'Ungwan Rimi', price: '#25,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Royal Hotel', location: 'Trikiana', price: '#55,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel2.png', name: 'Goshen Hotel', location: 'Ungwan Pama', price: '#25,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', name: 'Equatorial Hotel', location: 'Kaduna North', price: '#75,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ),
    const BookHotelProduct(imgPaths: 'assets/images/hotel/hotel1.png', name: 'Protect Hotel', location: 'Romi', price: '#25,000',
      description: 'Amet minim mollit non deserunt ullamco est sit\naliqua dolor do amet sint. Velit officia consequat\nduis enim velit mollit.',
      latitude: 10.3125, longitude: 7.6793,
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg' ],
    ),
  ].obs;


  ///Selected Product
  var selectedProduct = Rxn<BookHotelProduct>();

  ///Method to Selected Product
  void selectProduct(BookHotelProduct product) {
    selectedProduct.value = product;
  }

  ///Tracks press state for buttons
  var isPressed = false.obs;
  RxBool isImageLoaded = false.obs;

  ///Simulate image loading
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