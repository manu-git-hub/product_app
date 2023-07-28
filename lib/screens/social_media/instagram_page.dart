import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import '../application/instagram_profile.dart';

class InstagramPage extends StatefulWidget {
  const InstagramPage({Key? key}) : super(key: key);

  @override
  _InstagramPageState createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {
  final TextEditingController _usernameController = TextEditingController();
  String? _profilePictureUrl;
  String? _accessToken;

  Future<void> _getLongLivedAccessToken(String shortLivedToken) async {
    const String clientId = 'YOUR_CLIENT_ID';
    const String clientSecret = 'YOUR_CLIENT_SECRET';
    final String apiUrl = 'https://graph.instagram.com/access_token'
        '?grant_type=ig_exchange_token'
        '&client_secret=$clientSecret'
        '&access_token=$shortLivedToken';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _accessToken = data['access_token'];
        });
      } else {
        throw Exception('Failed to exchange token.');
      }
    } catch (e) {
      throw Exception('Error occurred during token exchange.');
    }
  }

  Future<void> _getProfilePicture() async {
    final String username = _usernameController.text.trim();
    const String apiVersion = 'v12.0'; // Replace with the desired API version
    final String apiUrl = 'https://graph.instagram.com/$apiVersion/$username?fields=profile_picture_url&access_token=$_accessToken';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _profilePictureUrl = data['profile_picture_url'];
        });

        // Navigate to InstagramProfilePage with the fetched profile picture URL
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InstagramProfilePage(profilePictureUrl: _profilePictureUrl),
          ),
        );
      } else {
        Fluttertoast.showToast(msg: 'Failed to fetch profile picture.');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error occurred. Please try again later.');
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
              onPressed: () async {
                // Replace 'YOUR_SHORT_LIVED_ACCESS_TOKEN' with the actual short-lived access token
                final String shortLivedToken = 'YOUR_SHORT_LIVED_ACCESS_TOKEN';
                await _getLongLivedAccessToken(shortLivedToken);
                if (_accessToken != null) {
                  _getProfilePicture();
                }
              },
              child: const Text('Get Profile Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
