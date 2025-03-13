import 'package:bookhotel/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

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
                      ],
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

