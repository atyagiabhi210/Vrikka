import 'package:flutter/material.dart';

class body extends StatelessWidget {
  final Widget child;
  const body({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack( 
    children: <Widget>[
      Positioned(
        top: 0,
        left: 0,
        child: Image.asset(
          "assets/images/main_top.png",
          width: MediaQuery.of(context).size.width * 0.3,
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Image.asset(
          "assets/images/login_bottom.png",
          width: MediaQuery.of(context).size.width * 0.4,
        ),
      ),
      child
      //SignUpScreen()
    ],
          );
  }
}