import 'package:flutter/material.dart';
import 'package:profile_picture/widgets/button.dart';
import '../widgets/appbar.dart';
import '../widgets/background.dart';
import '../widgets/custom_whatsapp.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WhatsAppState createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Create a fade-in animation for the profile picture

    // Start the fade-in animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'WhatsApp Profile'),
      body: CustomBackground(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Using the reusable ProfilePicture widget
              const ProfilePicture(
                imageUrl: 'https://example.com/whatsapp_profile_image.jpg',
                size: 150.0,
              ),
              const SizedBox(height: 20),
              // Using the reusable DownloadButton widget
              CustomButton(
                buttonName: "Download Profile Picture",
            
                onPressed: () {
                  // Implement the download functionality here
                },
              ),
              const SizedBox(height: 20),
              // Using the reusable AnimatedTypewriterText widget
              const AnimatedTypewriterText(),
            ],
          ),
        ),
      ),
    );
  }
}
