import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InstagramProfilePage extends StatelessWidget {
  final String? profilePictureUrl;

  const InstagramProfilePage({Key? key, required this.profilePictureUrl})
      : super(key: key);

  void _downloadProfilePicture() {
    // Implement the logic to download the profile picture here.
    // You can use the profilePictureUrl to get the image data and save it locally.
    // Example code to download the image:
    // var response = await http.get(Uri.parse(profilePictureUrl));
    // Save the image data to the device's local storage.
    Fluttertoast.showToast(msg: 'Profile picture downloaded.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (profilePictureUrl != null)
              Image.network(profilePictureUrl!),
            ElevatedButton(
              onPressed: () {
                _downloadProfilePicture();
              },
              child: const Text('Download Profile Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
