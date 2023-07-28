import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ProfilePicture extends StatelessWidget {
  final String imageUrl;
  final double size;

  const ProfilePicture({
    super.key,
    required this.imageUrl,
    this.size = 150.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
      ),
      child: ClipOval(
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AnimatedTypewriterText extends StatelessWidget {
  const AnimatedTypewriterText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Make Your WhatsApp Profile Shine!',
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
    );
  }
}
