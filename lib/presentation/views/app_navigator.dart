import 'package:bookhotel/presentation/views/mains/homepage/homepage.dart';
import 'package:bookhotel/presentation/views/mains/search/search_page.dart';
import 'package:bookhotel/presentation/views/others/favourite/favourite_screen.dart';
import 'package:bookhotel/presentation/views/others/setting/setting_page.dart';
import 'package:flutter/material.dart';


class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _selectedIndex = 0;

  final screens =  [
    const AppHomePage(),
    FavouritePage(),
    const SearchPage(),
    const SettingPage(),

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  screens[
        _selectedIndex
        ],
        bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
          elevation: 3.0,
          child: BottomNavigationBar(
          backgroundColor: const Color(0xFF2D2D2D),
          iconSize: 20,
          selectedItemColor: const Color(0xFFffffff),
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
            onTap: (i) {
             setState(() {
              _selectedIndex = i;
              });
              },
                currentIndex: _selectedIndex,
                items:  const [
                  BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined, ),
                          label:'Home',
                  ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined),
                      label:'Favourite',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                icon :Icon(Icons.people,),
                label:'Profile',
            ),
        ],
        ),
        ),
    );
  }
}
