import 'package:flutter/cupertino.dart';

class LogInPage extends StatelessWidget{
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text('Log In Page'),
      ),
    );
  }
}