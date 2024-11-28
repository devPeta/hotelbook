import 'package:bookhotel/presentation/views/mains/homepage/homepage.dart';
import 'package:bookhotel/presentation/views/mains/notifications/notification_page.dart';
import 'package:bookhotel/presentation/views/mains/search/search_page.dart';
import 'package:bookhotel/presentation/views/others/profile/profile_page.dart';
import 'package:bookhotel/presentation/views/others/schedule/schedule_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  @override
  int _selectedIndex = 0;

  final screens = const [
    AppHomePage(),
    SchedulePage(),
    SearchPage(),
    NotificationPage(),
    ProfilePage(),
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
          backgroundColor: const Color(0xFFffffff),
          iconSize: 20,
          selectedItemColor: const Color(0xFF2D2D2D),
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
                  icon: Icon(Icons.schedule_rounded),
                      label:'Scheduling',
                  ),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label:'Search',
                  ),
                  BottomNavigationBarItem(
                  icon :Icon(Icons.notification_add_outlined),
                      label:'Notifications',
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
