import 'package:flutter/material.dart';
import '../../widgets/appbar.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/profile.dart';
import '../../widgets/animation_type.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class FacebookProfilePage extends StatefulWidget {
  final String profilePictureUrl;
  final String username;

  const FacebookProfilePage({
    Key? key,
    required this.profilePictureUrl,
    required this.username,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FacebookProfilePageState createState() => _FacebookProfilePageState();
}

class _FacebookProfilePageState extends State<FacebookProfilePage> {
  Future<void> _saveImageToDevice() async {
  final response = await http.get(Uri.parse(widget.profilePictureUrl));
  if (response.statusCode == 200) {
    final appDir = await getTemporaryDirectory();
    final facebookDirPath = '${appDir.path}/facebook';
    final fileName = 'profile_picture_${widget.username}.jpg'; // Customize the file name

    // Check if the "facebook" folder already exists
    final facebookDir = Directory(facebookDirPath);
    if (!await facebookDir.exists()) {
      await facebookDir.create(recursive: true); // Create the "facebook" directory
    }

    final file = File('$facebookDirPath/$fileName');
    await file.writeAsBytes(response.bodyBytes);
    final result = await ImageGallerySaver.saveFile(file.path);
    // ignore: avoid_print
    print('Image saved: $result');
  } else {
    // ignore: avoid_print
    print('Failed to download image: ${response.statusCode}');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Facebook Profile',
      ),
      body: CustomBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTypewriterText(
                text: 'Welcome to ${widget.username}!',
              ),
              const SizedBox(height: 16),
              ProfilePicture(
                imageUrl: widget.profilePictureUrl,
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
