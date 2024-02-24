import 'package:flutter/material.dart';
import 'package:vrikka/auth.dart';
import 'package:vrikka/signup/components/background.dart';
import 'package:vrikka/signup/member_signup/member_signup.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: body(
        child: Column(
          
          children: [
          SizedBox(
            height: size.height * 0.09,
          ),
          const Align(
            alignment: Alignment.center,
            child:Text( "SIGNUP", style: TextStyle(fontWeight: FontWeight.bold,)) ,
          ),
          //SvgPicture.asset("assets/icons/signup.svg", height: size.height * 0.4),
          Image.asset("assets/images/on_boarding_images/Eating healthy food-pana.png",
              height: size.height * 0.4),
          SizedBox(
              height: size.height * 0.02,
            ),
          ElevatedButton(
              
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).colorScheme.tertiary),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)))),
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder:  (context) => AuthPage()));

              },
              child: const Text(
                "Member",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),

              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).colorScheme.tertiary),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(29)))),
              onPressed: () {},
              child: const Text(
                "Caregiver",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            )

          
        ]),
      ),
    );
  }
}
