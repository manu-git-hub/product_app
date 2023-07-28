import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;

  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: Colors.indigo.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text(
        buttonName,
        style: GoogleFonts.mPlus1Code(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
