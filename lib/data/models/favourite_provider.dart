import 'package:bookhotel/data/models/favourite_model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FavouriteProvider extends ChangeNotifier{
  List<FavouriteModel> _favourite = [];

  List<FavouriteModel> get favourite => _favourite;

  void addFavouriteItem( FavouriteModel favouriteItems){
    _favourite.add(favouriteItems);
    notifyListeners();
  }

  void removeFavouriteItem(FavouriteModel favouriteItems){
    _favourite.remove(favouriteItems);
    notifyListeners();
  }
 }