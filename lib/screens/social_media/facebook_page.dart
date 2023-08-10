import 'package:flutter/material.dart';
import '../../widgets/alert.dart';
import '../../widgets/appbar.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/text_field.dart';
import '../application/facebook_profile.dart';
import '../../widgets/animation_type.dart';

class FacebookPage extends StatefulWidget {
  const FacebookPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FacebookPageState createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage> {
  final TextEditingController _usernameController = TextEditingController();

  Future<void> _getProfilePicture() async {
    final username = _usernameController.text.trim();
    if (username.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'Username is Empty',
          content: 'Please enter a Facebook username.',
          onOkPressed: () => Navigator.pop(context),
        ),
      );
      return;
    }

    final profilePictureUrl = 'https://graph.facebook.com/$username/picture?type=large';

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FacebookProfilePage(
          profilePictureUrl: profilePictureUrl,
          username: username,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Facebook Page'),
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
                width: 300,
                child: CustomTextField(
                  controller: _usernameController,
                  hintText: 'Enter Facebook Username',
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
