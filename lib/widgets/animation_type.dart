import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTypewriterText extends StatelessWidget {
  final String text;

  const AnimatedTypewriterText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          text,
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
