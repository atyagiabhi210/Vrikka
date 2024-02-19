import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vrikka/login/components/background.dart';
import 'package:vrikka/login/components/roundedinputfield.dart';
import 'package:vrikka/login/components/roundedpassfield.dart';
import 'package:vrikka/signup/screens/signupscreen.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final EmailTextController = TextEditingController();
    final PassTextController = TextEditingController();
    return background(
      child:SingleChildScrollView(
        child:Column(
        children: [
          SizedBox(
            height: size.height * 0.09,
          ),
          const Text("LOGIN"),
          SvgPicture.asset("assets/icons/login.svg", height: size.height * 0.4),
          RoundedInputField(
            textController: EmailTextController,
            hintText: "Your Email",
            onChanged: (value) {},
          ),
          RoundedInputPassField(
              textController: PassTextController,

              hintText: "Enter your password", onChanged: (value) {}),
          ElevatedButton(onPressed: () {}, child: Text("LOGIN")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an Account ?",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text("Sign Up",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ), 
      )
       
    );
  }
}






