import 'package:flutter/material.dart';

class InstagramProfilePage extends StatelessWidget {
  final String profilePictureUrl;

  const InstagramProfilePage({Key? key, required this.profilePictureUrl})
      : super(key: key);

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
            Image.network(profilePictureUrl), // Display profile picture from the URL
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
