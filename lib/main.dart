import 'package:flutter/material.dart';
import 'package:vrikka/login/screens/logInPage.dart';
import 'package:vrikka/onboarding/onboarding.dart';
import 'package:vrikka/theme/lighttheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      debugShowCheckedModeBanner: false,
      home: const OnBoardingScreen(),
    );
  }
}
