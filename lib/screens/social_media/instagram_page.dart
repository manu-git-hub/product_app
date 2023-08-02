import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/alert.dart';
import '../../widgets/animation_type.dart';
import '../../widgets/appbar.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../application/instagram_profile.dart';

class InstagramPage extends StatefulWidget {
  const InstagramPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InstagramPageState createState() => _InstagramPageState();
}

class _InstagramPageState extends State<InstagramPage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _getProfilePicture() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Username is Empty',
          content: 'Please enter a Instagram username.',
          onOkPressed: () => Navigator.pop(context),
        ),
      );
      return;
    }

    final url =
        'https://instagram-profile1.p.rapidapi.com/getprofile/$username';

    final headers = {
      'X-RapidAPI-Key': 'b6ca451293msh63eb725cd79eb2ap186d52jsn8de54a702884',
      'X-RapidAPI-Host': 'instagram-profile1.p.rapidapi.com',
    };

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final profilePictureUrl = data['profile_pic_url'];

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InstagramProfilePage(
              profilePictureUrl: profilePictureUrl,
              username: username,
            ),
          ),
        );
      } else {
        // ignore: avoid_print
        print('API Call failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error occurred: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Instagram Page'),
      body: CustomBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimatedTypewriterText(
                text: 'Username!',
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300, // Set the desired width of the TextField
                child: CustomTextField(
                  controller: _usernameController,
                  hintText: 'Enter Instagram Username',
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                buttonName: "Get Profile",
                onPressed: _getProfilePicture,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
