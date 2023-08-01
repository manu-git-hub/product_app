import 'package:flutter/material.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';
import '../../widgets/alert.dart';
import '../../widgets/animation_type.dart';
import '../../widgets/appbar.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../application/twitter_profile.dart';

class TwitterPage extends StatefulWidget {
  const TwitterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _getProfilePicture() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Username is Empty',
          content: 'Please enter a Twitter username.',
          onOkPressed: () => Navigator.pop(context),
        ),
      );
      return;
    }

    // final url =
    // 'https://instagram-profile1.p.rapidapi.com/getprofile/$username';

    //Change to Instagram
    //     '';

    // final headers = {
    // 'X-RapidAPI-Key': 'b6ca451293msh63eb725cd79eb2ap186d52jsn8de54a702884',
    // 'X-RapidAPI-Host': 'instagram-profile1.p.rapidapi.com',

    //change to Facebook
    //   'X-RapidAPI-Key': '',
    //   'X-RapidAPI-Host':'',
    // };

    // try {
    //   final response = await http.get(
    //     Uri.parse(url),
    //     headers: headers,
    //   );
    // if (response.statusCode == 200) {
    // final data = json.decode(response.body);
    // final profilePictureUrl = data['profile_pic_url'];

    // ignore: use_build_context_synchronously
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const TwitterProfilePage(
    // profilePictureUrl: profilePictureUrl,
    // username: username,
    //           ),
    //     ),
    //   );
    // }
    // else {
    // ignore: avoid_print
    //     print('API Call failed with status code: ${response.statusCode}');
    //   }
    // } catch (error) {
    // ignore: avoid_print
    //     print('Error occurred: $error');
    //   }
    // }

    //Dummy Navigation
    if (true) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TwitterProfilePage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Twitter Page'),
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
                  hintText: 'Enter Twitter Username',
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
