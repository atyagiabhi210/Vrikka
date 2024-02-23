import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrikka/homepage/screens/homepage.dart';
import 'package:vrikka/signup/member/bloc/member_bloc.dart';
import 'package:vrikka/signup/member/components/member_rounded_password_field.dart';
import 'package:vrikka/signup/member/models/member_sign_up_model.dart';

class ConfirmPasswordScreen extends StatefulWidget {
  @override
  State<ConfirmPasswordScreen> createState() {
    // TODO: implement createState
    return _ConfirmPasswordScreenState();
  }
}

class _ConfirmPasswordScreenState extends State<ConfirmPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  MemberBloc memberBloc = MemberBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MemberBloc, MemberState>(
      bloc: memberBloc,
      listener: (context, state) {
        if (state is MemberSignUpSucessState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => HomePage()));
        }
        if (state is MemberSignUpErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error in Sign Up"),
            ),
          );
        }
        if (state is MemberSignUpLoadingState) {
          print("Loading");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Loading"),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Text(
                    "Password Setup",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Image.asset(
                    "assets/images/on_boarding_images/Reminders-pana (2).png",
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: MemberRoundedPasswordField(
                      hintText: "Enter Your Password",
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      textController: passwordController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: MemberRoundedPasswordField(
                      hintText: "Confirm Your Password",
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      textController: confirmPasswordController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70, 0, 70, 0),
                    child: ElevatedButton(
                        onPressed: () {
                          int user = 0;

                          memberBloc.add(MemberPasswordSelectEvent(
                            user: user,
                            password: [
                              MemberPasswordModel(
                                  password: passwordController.text)
                            ],
                          ));
                          print(memberBloc.memberSignUpModel.length);
                          log(memberBloc.memberSignUpModel[user].name);
                          log(memberBloc.memberSignUpModel[user].dialysisStatus.toString());
                       //   log(memberBloc.memberSignUpModel[user].password);
                          log(memberBloc.memberSignUpModel[user].phoneNumber);
                         // print(memberBloc.memberSignUpModel[0].password);
                         // memberBloc.add(MemberSignUpEvent(user: user));
                         /* memberBloc.add(MemberSignUpEvent( 
                            user:user,
                            memberSignUpModel: [
                              MemberSignUpModel(
                                  name: memberBloc.memberBasicDetailsModel[user].name,
                                  email: memberBloc.memberBasicDetailsModel[user].email,
                                  phoneNumber: memberBloc.memberBasicDetailsModel[user].phoneNumber,
                                  dietVeg: memberBloc.memberDietPreferencesModel[user].dietVeg,
                                  dietNonVeg: memberBloc.memberDietPreferencesModel[user].dietNonVeg,
                                  dietEggitarian: memberBloc.memberDietPreferencesModel[user].dietEggitarian,
                                  dietVegan: memberBloc.memberDietPreferencesModel[user].dietVegan,
                                  dietPescitarian: memberBloc.memberDietPreferencesModel[user].dietPescitarian,
                                  dialysisStatus: memberBloc.memberDialysisStatusModel[user].dialysisStatus,
                                  password: memberBloc.memberPasswordModel[user].password,
                                  username: memberBloc.memberBasicDetailsModel[0].username
                              )
                            ]
                          ));*/
                          user++;

                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ConfirmPasswordScreen()));*/
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Submit"),
                            //Icon(Icons.arrow_forward_ios_rounded)
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
