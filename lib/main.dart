import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:vrikka/onboarding/onboarding.dart';
import 'package:vrikka/reminder/reminder_homepage.dart';
import 'package:vrikka/theme/lighttheme.dart';
import 'package:vrikka/welcome_screen/screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboarding = prefs.getBool("onboarding") ?? false;
  runApp(MyApp(
    onboarding: onboarding,
  ));
}

class MyApp extends StatelessWidget {
  final bool onboarding;
  const MyApp({super.key, required this.onboarding});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: lightMode,
          debugShowCheckedModeBanner: false,
          home: onboarding ? const OnBoardingView() : const ReminderHomePage(),
        );
      },
    );
  }
}
