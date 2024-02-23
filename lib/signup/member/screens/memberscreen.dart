import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vrikka/homepage/screens/homepage.dart';
import 'package:vrikka/signup/member/components/member_rounded_password_field.dart';
import 'package:vrikka/signup/member/components/member_roundedinoutfield.dart';
class MemberSignUpScreen extends StatefulWidget {
  @override
  _MemberSignUpScreenState createState() => _MemberSignUpScreenState();
}
class _MemberSignUpScreenState extends State<MemberSignUpScreen>{


  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Icon(Icons.lock, size: 100,),
            SizedBox(height: 20,),
            MemberRoundedInputField(
              keyboardType: TextInputType.emailAddress,
              hintText: "Email",
              icon: Icons.email,
              textController: emailController,
            ),
             SizedBox(height: 20,),
            MemberRoundedPasswordField(
              keyboardType: TextInputType.emailAddress,
              hintText: "Password",
              icon: Icons.email,
              textController: passwordController,
            ),
            ElevatedButton(onPressed: 
            (){
              signInUser();
            }, child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }

  void errorMessage(
    String message
  ){
    showDialog(context: context, builder: (ctx){
      return AlertDialog(
        title: Text("Error"),
        content: Text("Wrong Password"),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("OK"))
        ],
      );
    });
  }

  void signInUser() async{
    showDialog(context: context, builder: (ctx){
      return Center(child: CircularProgressIndicator(),);
    });

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);


    }
    on FirebaseAuthException catch(e){
      if(e.code == 'weak-password'){
        errorMessage("The password provided is too weak");
    }
    else if(e.code == 'email-already-in-use'){
      errorMessage("The account already exists for that email");
    }

  }
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  
}

  
}