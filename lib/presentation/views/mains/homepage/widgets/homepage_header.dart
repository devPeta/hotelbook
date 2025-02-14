import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:bookhotel/core/common/apphometextfield.dart';
import 'package:bookhotel/core/common/styles/header_color_container.dart';
import 'package:bookhotel/presentation/views/mains/notifications/notification_page.dart';


class HomepageHeaderController extends GetxController {
  var isPressed = false.obs;

  void onTapDown() {
    isPressed.value = true;
  }

  void onTapUp(Function()? onTap) {
    isPressed.value = false;
    if (onTap != null) {
      onTap();
    }
  }

  void onTapCancel() {
    isPressed.value = false;
  }
}

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final HomepageHeaderController controller = HomepageHeaderController();
    return AppHeaderContainer(
      height:235,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02,),

          ///AppBar
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Profile
              CircleAvatar(
                radius: 12.5,
                backgroundColor: const Color(0xff2D2D2D),
                child: CircleAvatar(
                  radius: 12.5,
                  child: Image.asset('assets/images/Profile Picture.png'),
                ),
              ),
              ///Icon Location + Name
              Center(
                child:Row(
                  children: [
                    const Icon(Icons.location_on_outlined, color: Colors.white, size: 12,),
                    const SizedBox(width: 4,),
                    Text('Kaduna, Nigeria',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),


              ///Notification icon
              GestureDetector(
                  onTap: (){
                    Get.to(const NotificationPage());
                  },
                  onTapDown: (_) => controller.onTapDown(),
                  onTapCancel: controller.onTapCancel,
                  child:  Obx(() => AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      child: Icon(Icons.notifications_outlined, size: 32,
                      color: controller.isPressed.value ? Colors.white.withOpacity(0.5) : Colors.white,
                                  ),
                  ),
              ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02,),

          ///Find Hotels
          Text.rich(
            TextSpan(
              text: 'Find ',
              style: GoogleFonts.raleway(fontSize: 20, color: Colors.white),
              children: [
                TextSpan(
                    text: 'Hotels, Villas,\nLodging',
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 20, color: Colors.white)
                ),
                TextSpan(
                    text: ', that are around you!',
                      style: GoogleFonts.raleway(
                        fontSize: 20, color: Colors.white)
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.01,),

          ///Search For the best Hotels
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Expanded(
                child: AppHomeTextField(
                  hintText: 'Find the best Hotels',
                ),
              ),
              const SizedBox(width: 8,),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff2194FF),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.search, color: Colors.white, size: 20,),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}