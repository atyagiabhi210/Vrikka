import 'package:flutter/material.dart';
import 'package:vrikka/signup/member/components/member_roundedinoutfield.dart';
//import 'package:vrikka/signup/member/components/member_textfieldcontainer.dart';

class MemberSignUpScreen extends StatefulWidget {
  @override
  State<MemberSignUpScreen> createState() {
    return _MemberSignUpScreenState();
  }
}

class _MemberSignUpScreenState extends State<MemberSignUpScreen> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Sbackground(
        size: size,
        child: Column(children: [
          SizedBox(
            height: size.height * 0.09,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),

              
            ),
            
          ),
          MemberRoundedInputField(hintText: "Enter Your Name", textController: nameController, icon: Icons.person,keyboardType: TextInputType.name,),
          MemberRoundedInputField(hintText: "Enter Your Email", textController: nameController, icon: Icons.email,keyboardType: TextInputType.emailAddress,),
          MemberRoundedInputField(hintText: "What Should We Call You..?", textController: nameController, icon: Icons.person_4,keyboardType: TextInputType.name,),
          MemberRoundedInputField(hintText: "Enter Mobile Number", textController: nameController, icon: Icons.phone,keyboardType: TextInputType.numberWithOptions(),),

        ]),
      ),
    );
  }
}



class Sbackground extends StatelessWidget {
  final child;
  const Sbackground({super.key, required this.size, required this.child});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [],
      ),
    );
  }
}
