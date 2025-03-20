import 'package:bookhotel/presentation/controller/user_controller.dart';
import 'package:bookhotel/presentation/views/others/profile/widgets/profile_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final UserController controller = Get.put(UserController());
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.02),

                        /// 🔹 Profile Avatar
                        Obx(() {
                          return CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person, size: 60),
                          );
                        }),

                        SizedBox(height: height * 0.01),

                        /// 🔹 Edit Profile Picture (Future Feature)
                        TextButton(
                          onPressed: () {
                            // Future feature for changing profile picture
                          },
                          child: const Text('Change Profile Picture'),
                        ),

                        SizedBox(height: height * 0.02),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.1),
                  const Divider(color: Color(0xff2D2D2D)),
                  SizedBox(height: height * 0.1),

                  /// 🔹 User Details (Fetched from Firestore)
                  Obx(() => ProfileMenu(
                    title: 'Full Name',
                    value: controller.fullName.value,
                    onPressed: () {},
                    icon: Icons.person,
                  )),

                  ProfileMenu(
                    title: 'User ID',
                    value: user.uid,
                    onPressed: () {},
                    icon: Icons.copy,
                  ),

                  Obx(() => ProfileMenu(
                    title: 'Email',
                    value: controller.email.value,
                    onPressed: () {},
                    icon: Icons.copy,
                  )),

                  Obx(() => ProfileMenu(
                    title: 'Phone Number',
                    value: controller.phoneNumber.value,
                    onPressed: () {},
                    icon: Icons.navigate_next,
                  )),

                  ProfileMenu(
                    title: 'Date Of Birth',
                    value: '31 July 2001', // Replace with actual data later
                    onPressed: () {},
                    icon: Icons.navigate_next,
                  ),

                  ProfileMenu(
                    title: 'Gender',
                    value: 'M', // Replace with actual data later
                    onPressed: () {},
                    icon: Icons.navigate_next,
                  ),

                  SizedBox(height: height * 0.1),

                  /// 🔹 Log Out Button
                  Center(
                    child: TextButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        Get.offAllNamed('/login'); // Navigate to login screen
                      },
                      child: const Text(
                        'Log Out',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
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

// import 'package:bookhotel/presentation/controller/profile_controller.dart';
// import 'package:bookhotel/presentation/views/others/profile/widgets/profile_menu.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProfilePage extends StatelessWidget {
//   final ProfileController controller = Get.put(ProfileController());
//   final user = FirebaseAuth.instance.currentUser!;
//
//   @override
//   Widget build(BuildContext context) {
//     final double height = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Column(
//                       children: [
//                         SizedBox(height: height * 0.02),
//
//                         /// Profile Avatar
//                         Obx(() {
//                           return CircleAvatar(
//                             radius: 40,
//                             backgroundColor: Colors.grey[300],
//                             backgroundImage: controller.imageFile.value != null
//                                 ? FileImage(controller.imageFile.value!)
//                                 : (controller.imageUrl.value.isNotEmpty
//                                 ? NetworkImage(controller.imageUrl.value)
//                                 : null) as ImageProvider?,
//                             child: (controller.imageFile.value == null &&
//                                 controller.imageUrl.value.isEmpty)
//                                 ? const Icon(Icons.person, size: 60)
//                                 : null,
//                           );
//                         }),
//
//                         SizedBox(height: height * 0.01),
//
//                         /// Edit Profile Picture
//                         TextButton(
//                           onPressed: controller.pickImage,
//                           child: const Text('Change Profile Picture'),
//                         ),
//
//                         SizedBox(height: height * 0.02),
//                       ],
//                     ),
//                   ),
//
//                   SizedBox(height: height * 0.1),
//                   const Divider(color: Color(0xff2D2D2D)),
//
//                   SizedBox(height: height * 0.1),
//
//                   /// ProfileMenu
//                   ProfileMenu(title: 'User ID', value: user.uid, onPressed: () {}, icon: Icons.copy),
//                   ProfileMenu(title: 'Email', value: user.email ?? '', onPressed: () {}, icon: Icons.copy),
//                   ProfileMenu(title: 'Phone Number', value: user.phoneNumber ?? 'Not Set', onPressed: () {}, icon: Icons.navigate_next),
//                   ProfileMenu(title: 'Date Of Birth', value: '31 July 2001', onPressed: () {}, icon: Icons.navigate_next),
//                   ProfileMenu(title: 'Gender', value: 'M', onPressed: () {}, icon: Icons.navigate_next),
//
//                   SizedBox(height: height * 0.1),
//
//                   Center(
//                     child: TextButton(
//                       onPressed: controller.logout,
//                       child: const Text('Log Out', style: TextStyle(color: Colors.red)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
