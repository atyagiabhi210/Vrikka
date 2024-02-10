import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: Container(
          height: 100,
          width: 300,
          color: Theme.of(context).colorScheme.primary,
          child: Text("Hello"),
        ),
      ),
    );
  }
}
