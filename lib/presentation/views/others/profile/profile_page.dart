import 'package:bookhotel/presentation/controller/profile_controller.dart';
import 'package:bookhotel/presentation/views/others/profile/profile_edit.dart';
import 'package:bookhotel/presentation/views/others/profile/widgets/profile_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
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
                        SizedBox(height: height * 0.01),

                        /// Profile Avatar
                        Obx(() => CircleAvatar(
                              radius: 34,
                              backgroundColor: const Color(0xff2D2D2D),
                              backgroundImage: controller.imageUrl.value.isNotEmpty
                                  ? NetworkImage(controller.imageUrl.value)
                                  : null,
                              child: controller.imageUrl.value.isEmpty
                                  ? const Icon(Icons.person, size: 60)
                                  : null,
                            )),

                        SizedBox(height: height * 0.01),

                        /// Edit Profile Picture
                        TextButton(
                          onPressed: controller.pickImage,
                          child: const Text('Change Profile Picture'),
                        ),

                        SizedBox(height: height * 0.02),

                        /// 🔹 **New "Edit Profile" Button**
                        ElevatedButton(
                          onPressed: () async {
                            await Get.to(() => EditProfileScreen());
                            controller.fetchProfileImage(); // Refresh Profile Data after returning
                          },
                          child: const Text('Edit Profile'),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.01),
                  Divider(),

                  SizedBox(height: height * 0.01),

                  /// ProfileMenu
                  ProfileMenu(title: 'User ID', value: user.uid, onPressed: () {}, icon: Icons.copy),
                  ProfileMenu(title: 'Email', value: user.email ?? '', onPressed: () {}, icon: Icons.copy),
                  ProfileMenu(title: 'Phone Number', value: user.phoneNumber ?? 'Not Set', onPressed: () {}, icon: Icons.navigate_next),
                  ProfileMenu(title: 'Date Of Birth', value: '31 July 2001', onPressed: () {}, icon: Icons.navigate_next),
                  ProfileMenu(title: 'Gender', value: 'M', onPressed: () {}, icon: Icons.navigate_next),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                        Get.offAllNamed('/login'); // Redirect to login
                      },
                      child: const Text('Log Out', style: TextStyle(color: Colors.red)),
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
