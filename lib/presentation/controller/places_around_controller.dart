import 'package:bookhotel/data/models/visit_model.dart';
import 'package:get/get.dart';


class PlacesAroundController extends GetxController {
  RxList<VisitAroundModel> visitAroundModel = <VisitAroundModel> [
    VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png', title: 'Kajuru Castle',  address: 'kajuru LGA, Kaduna South',
      images: [ 'assets/images/places/0.jpg', 'assets/images/places/5.jpg', 'assets/images/places/4.jpg'
      ],
      description: 'Kajuru Castle is a unique medieval-style villa located in Kajuru Local Government Area, Kaduna State, Nigeria. Built between 1981 by a German expatriate, the castle reflects European architectural influences. \n Featuring turrets, an armory, and a dungeon.',
      latitude: 10.3125,
      longitude: 7.6793,
    ),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place3.png', title: 'Kaduna Museum',
      address: 'Ali Akilu Road, Ungwan Sarki, Kaduna',
      images: [
        'assets/images/places/m1.jpg', 'assets/images/places/m2.jpg', 'assets/images/places/m3.jpg'
      ],
      description: 'The Kaduna Museum houses a substantial collection of archaeological, ethnographic, and craft exhibits, reflecting Nigeria rich cultural heritage. \n The museum architecture is also noteworthy, featuring Hausa building structures made from mud and thatch, which adds to its cultural allure.',
      latitude: 10.5076,
      longitude: 7.4364790,
    ),
    VisitAroundModel(imgPaths: 'assets/images/hotel/place2.png',
      title: 'Kagoro Hills',
      address: 'Southern Kaduna, Kaura LGA, Kaduna',
      images: [
        'assets/images/places/2.jpg', 'assets/images/places/3.jpg', 'assets/images/places/6.jpg'
      ],
      description: 'Kagoro Hills is a stunning natural landmark located in southern Kaduna State, Nigeria, near the town of kagoro in Kaura Local Government Area.\n The Hills are surrounded by lush greenery and rocky terrains, making them a popular destination for hikers, natural enthusiasts and tourists. \n Beyond their beauty, the Kagoro Hills hold cultural significance for the Kagoro people, serving as a historical and spiritual site.',
      latitude: 9.5816,
      longitude: 8.47298,
    ),
  ].obs;


  ///Selected Product
  var selectedProduct = Rxn<VisitAroundModel>();

  ///Method to Selected Product
  void selectProduct(VisitAroundModel product) {
    selectedProduct.value = product;
  }
}