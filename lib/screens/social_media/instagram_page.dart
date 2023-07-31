import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../application/instagram_profile.dart';

class InstagramPage extends StatefulWidget {
  const InstagramPage({Key? key}) : super(key: key);

  @override
  _InstagramPageState createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _getProfilePicture() async {
    final username = _usernameController.text;
    final url =
        'https://instagram-profile1.p.rapidapi.com/getprofile/$username';

    final headers = {
      'X-RapidAPI-Key': 'b6ca451293msh63eb725cd79eb2ap186d52jsn8de54a702884',
      'X-RapidAPI-Host': 'instagram-profile1.p.rapidapi.com',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final profilePictureUrl = data['profile_pic_url'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InstagramProfilePage(
              profilePictureUrl: profilePictureUrl,
            ),
          ),
        );
      } else {
        print('API Call failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Enter Instagram Username',
              ),
            ),
            ElevatedButton(
              onPressed: _getProfilePicture,
              child: const Text('Get Profile Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
