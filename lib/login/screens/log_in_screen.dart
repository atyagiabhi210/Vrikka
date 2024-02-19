import 'package:flutter/material.dart';
import 'package:vrikka/login/components/body.dart';
class LogInScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LogInScreenState();
  }

    
    
  
}
class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
    }

}