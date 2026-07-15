import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/styles.dart';

void main() {
  runApp(const ShowcaseApp());
}

class ShowcaseApp extends StatelessWidget {
  const ShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Animation Showcase',
      debugShowCheckedModeBanner: false,
      theme: AppStyles.theme,
      home: const HomeScreen(),
    );
  }
}
