import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const SplashScreen(),
    theme: ThemeData.light(), // Use light theme as default
    darkTheme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor:
          Colors.black, // Set the background color for dark theme
    ),
    themeMode:
        ThemeMode.system, // Theme mode follows system settings (light/dark)
    debugShowCheckedModeBanner: false,
    routes: {
      '/home': (context) => const HomePage(),
    },
  ));
}
