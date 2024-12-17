import 'package:bookhotel/core/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:Colors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                ApplicationBar(title: 'Profile', leadingIcon: null, showBackArrow: false, ),

                Center(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.01,),

                      ///Circle Avatar
                      Container(
                        height: 140,
                        width: 140,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset('assets/images/hotel/place2.png', height: 140,),
                        ),
                      ),

                      SizedBox(height: height * 0.01,),
                      ///Edit Profile Pic
                      TextButton(onPressed: (){}, child: const Text('Change Profile Pictures'), ),
                     ]
                  )
                ),
                SizedBox(height: height * 0.02,),
                const Divider(),
                SizedBox(height: height * 0.02,),


                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Profile Menu
                        ProfileSectionHeader(title: 'Profile Information',),
                        SizedBox(height: height * 0.01),
                        ProfileMenu(title: 'Name', value: 'Yakubu Peter', onPressed: () {}, icon: Icons.navigate_next,),
                        ProfileMenu(title: 'Username', value: 'Peta', onPressed: () {  }, icon: Icons.navigate_next,),

                        SizedBox(height: height * 0.02),
                        const Divider(),
                        SizedBox(height: height * 0.02),

                        const ProfileSectionHeader(title: 'Personal Information',),
                        SizedBox(height: height * 0.01),

                        SizedBox(height: height * 0.01),

                        ProfileMenu(title: 'userID', value: '134', onPressed: () {}, icon: Icons.copy,),
                        ProfileMenu(title: 'Email', value: 'yakubupeta34@gmail.com', onPressed: () {}, icon: Icons.copy,),
                        ProfileMenu(title: 'Phone Number', value: '+2348129425802', onPressed: () {}, icon: Icons.navigate_next,),
                        ProfileMenu(title: 'Date Of Birth', value: '31 July 2001', onPressed: () {}, icon: Icons.navigate_next,),
                        ProfileMenu(title: 'Gender', value: 'M', onPressed: () {}, icon: Icons.navigate_next,),

                        SizedBox(height: height * 0.02),

                        Center(
                          child: TextButton(onPressed: (){}, child: const Text('Delete Account', style: TextStyle(color: Colors.red),)
                          ),
                        )

                      ],
                    ),
                  ),
                ),



              ],
            ),
          )
      ),
    );
  }
}

class ProfileSectionHeader extends StatelessWidget {
  final String title;
  const ProfileSectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title, style: GoogleFonts.raleway(
      textStyle: const TextStyle(
        color: Color(0xff2D2D2D),
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onPressed;
  final IconData icon;

  const ProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded( flex: 3,
              child: Text(title, style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                  color: Color(0xff2D2D2D),
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Expanded(
              flex: 5,
              child: Text(value, style: GoogleFonts.inter(
                textStyle: const TextStyle(
                  color: Color(0xff2D2D2D),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Expanded(
                child: Icon(icon, size: 18,)
            ),
          ],
        ),
      ),
    );
  }
}