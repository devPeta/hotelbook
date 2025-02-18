import 'dart:io';
import 'package:bookhotel/core/common/appbar.dart';
import 'package:bookhotel/presentation/views/others/profile/widgets/profile_menu.dart';
import 'package:bookhotel/presentation/views/others/profile/widgets/profile_section_header.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  File? _imageFile; // Stores the selected image file
  final ImagePicker _picker = ImagePicker(); // Image picker instance

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Update the file
      });
    }
  }
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
                const ApplicationBar(title: 'Profile', leadingIcon: null, showBackArrow: false, ),

                Center(
                    child: Column(
                        children: [
                          SizedBox(height: height * 0.01,),

                          ///Circle Avatar
                          CircleAvatar(
                            radius: 34,
                            backgroundColor: const Color(0xff2D2D2D),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: _imageFile != null ? FileImage(_imageFile!) : null,
                              child: _imageFile == null
                                  ? const Icon(
                                Icons.person,
                                size: 60,
                              )
                                  : null,
                            ),
                            ),

                          SizedBox(height: height * 0.01,),

                          ///Edit Profile Pic
                          TextButton(onPressed: _pickImage,
                            child: const Text('Change Profile Pictures'),
                          ),
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
                        const ProfileSectionHeader(title: 'Profile Information',),
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
                          child: TextButton(onPressed: (){}, child: const Text('Log Out', style: TextStyle(color: Colors.red),)
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Center(
                          child: TextButton(onPressed: (){}, child: const Text('Save', style: TextStyle(color: Colors.green),)
                          ),
                        ),

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
