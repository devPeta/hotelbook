import 'package:bookhotel/core/common/styles/header_color_container.dart';
import 'package:bookhotel/presentation/views/others/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookhotel/core/common/appbutton.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///Profile Header

              AppHeaderContainer(
                height: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///AppBar
                    Text('Account',style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    const SizedBox(height: 8,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Image Of Profile And Also Username And Email
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Get.to(const ProfilePage());
                              },
                             child: CircleAvatar(
                                radius: 22.5,
                                backgroundColor: const Color(0xffffffff),
                                child: CircleAvatar(
                                  radius: 20.5,
                                  child: Image.asset('assets/images/Profile Picture.png'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Yakubu Peter', style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                const SizedBox(height: 4),
                                Text('devpeta342@gmail.com', style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                ),
                              ],
                            )
                          ],
                        ),

                        ///Edit Icon
                        GestureDetector(
                          onTap: () {},
                            child: const Icon(Icons.edit_sharp, color: Colors.white, size: 24,)),
                      ],
                    )
                  ],
                ),
              ),


              ///Setting Button
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  ///Account Settings
                  Text('Account Settings', style: GoogleFonts.raleway(
                    color: const Color(0xff2D2D2D),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  const SizedBox(height: 16,),

                  const SettingMenuTitle(title: 'My Addresses', subtitle: 'Set location address', icons: Icons.home_filled,),
                  const SizedBox(height: 4,),

                  const SettingMenuTitle(title: 'Geolocations', subtitle: 'Set recommendation based on location', icons: Icons.location_city_outlined,),
                  const SizedBox(height: 4,),

                  const SettingMenuTitle(title: 'Notifications', subtitle: 'Set any kind of notifications message', icons: Icons.notifications,),
                  const SizedBox(height: 4,),

                  const SettingMenuTitle(title: 'Account Privacy ', subtitle: 'Manage data usage and connected accounts', icons: Icons.account_balance_outlined,),
                  const SizedBox(height: 16,),

                  AppKButton(
                    label: 'Log Out',
                    onTap: (){},
                    width: double.infinity,
                    color: const Color(0xff2D2D2D).withOpacity(0.5),
                    shadowOpacity: 0.2,
                    height: 51,
                  ),
                    ],
                  ),
                ),
                ],
              ),
      ),
    );
  }
}


class SettingMenuTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icons;

  const SettingMenuTitle({Key? key,
    required this.title,
    required this.subtitle,
    required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      leading: Icon(icons, size: 28, color: const Color(0xff2d2d2d),),
      title: Text(title,   style: GoogleFonts.raleway(
        color: const Color(0xff2d2d2d),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      ),
      subtitle: Text(subtitle,  style: GoogleFonts.raleway(
        color: const Color(0xff2d2d2d),
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      ),
    );
  }
}
