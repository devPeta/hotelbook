import 'package:bookhotel/core/common/apptextbutton.dart';
import 'package:bookhotel/core/common/apptextfield.dart';
import 'package:bookhotel/presentation/controller/editprofile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());
  


  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppKTextField(
              controller: controller.nameController,
              labelText: 'Full Name',
            ),
            SizedBox(height: height * 0.01),
            AppKTextField(
              controller: controller.usernameController,
              labelText: 'UserName',
            ),
            SizedBox(height: height * 0.01),
            AppKTextField(
              controller: controller.phoneController,
              labelText: "Phone Number",
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: height * 0.02),

            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : Center(
                          child: TextButton(onPressed: controller.updateProfile, child: const Text('Save Changes', style: TextStyle(color: Colors.green),)
                          ),
                        ),
                ),
          ],
        ),
      ),
    );
  }
}
