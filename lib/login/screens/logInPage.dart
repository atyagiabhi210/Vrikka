import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool("onboarding", false);
          },
          child: Container(
            child: const Text(
              " Choti Bacchi kya lg rha h?? Acchi Chhuti h na ",
              style: TextStyle(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
