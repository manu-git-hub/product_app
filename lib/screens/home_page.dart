import 'package:flutter/material.dart';
import 'package:profile_picture/screens/social_media/twitter_page.dart';
import 'social_media/facebook_page.dart';
import 'social_media/instagram_page.dart';
import 'social_media/whatsapp.dart';
import '../widgets/appbar.dart';
import '../widgets/background.dart';
import '../widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Social Media Links',
      ),
      body: CustomBackground(
        // Use the custom background widget
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                // Use the CustomButton widget
                buttonName: 'WhatsApp',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WhatsApp()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                // Use the CustomButton widget
                buttonName: 'Instagram',

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InstagramPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                // Use the CustomButton widget
                buttonName: 'Facebook',

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FacebookPage()),
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                // Use the CustomButton widget
                buttonName: 'Twitter',

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TwitterPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
