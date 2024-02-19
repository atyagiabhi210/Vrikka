import 'package:flutter/material.dart';
import 'package:vrikka/login/screens/log_in_screen.dart';
import 'package:vrikka/signup/screens/signupscreen.dart';
import 'package:vrikka/welcome_screen/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //this will give us the total height and width of our device
    return Background(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          const Text(
            "Welcome to Vrikka",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          //SvgPicture.asset("assets/icons/chat.svg", height: size.height * 0.4),
          Image.asset("assets/images/on_boarding_images/Online Doctor-rafiki.png",
              height: size.height * 0.4),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.tertiary),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogInScreen()));
              },
              child: const Text(
                "Login",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ElevatedButton(
              
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).colorScheme.tertiary),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)))),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: const Text(
                "Sign Up",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
