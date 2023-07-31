import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import '../../widgets/animation_type.dart';
import '../../widgets/appbar.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/profile.dart';

class FacebookProfilePage extends StatefulWidget {
  // final String profilePictureUrl;
  // final String username;

  const FacebookProfilePage({
    Key? key,
    // required this.profilePictureUrl,
    // required this.username,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FacebookProfilePageState createState() => _FacebookProfilePageState();
}

class _FacebookProfilePageState extends State<FacebookProfilePage> {
  Future<void> _saveImageToDevice() async {
    // final response = await http.get(Uri.parse(widget.profilePictureUrl));
    // if (response.statusCode == 200) {
    //   final appDir = await getTemporaryDirectory();
    //   final file = File('${appDir.path}/profile_picture.jpg');
    //   await file.writeAsBytes(response.bodyBytes);
    //   final result = await ImageGallerySaver.saveFile(file.path);
    //   // ignore: avoid_print
    //   print('Image saved: $result');
    // } else {
    //   // ignore: avoid_print
    //   print('Failed to download image: ${response.statusCode}');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Instagram Profile',
      ),
      body: CustomBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimatedTypewriterText(
                // text: 'Welcome to ${widget.username}!',
                //Dummy

                text: "Welcome #Username",
              ),
              const SizedBox(height: 16),
              const ProfilePicture(
                // imageUrl: widget.profilePictureUrl,
                //Dummy

                imageUrl:
                    "https://photos5.appleinsider.com/gallery/50730-99989-Facebook-app-logo-xl.jpg",
              ),
              const SizedBox(height: 16),
              CustomButton(
                buttonName: "Download Image",
                onPressed: _saveImageToDevice,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
