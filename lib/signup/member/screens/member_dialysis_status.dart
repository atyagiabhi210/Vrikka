import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrikka/signup/member/bloc/member_bloc.dart';
import 'package:vrikka/signup/member/models/member_sign_up_model.dart';
import 'package:vrikka/signup/member/screens/member_confirm_pass.dart';

class MemberDialysisStatus extends StatefulWidget {
  
  @override
  State<MemberDialysisStatus> createState() {
    return _MemberDialysisStatusState();
  }
}

class _MemberDialysisStatusState extends State<MemberDialysisStatus> {
  bool value = false;
  final MemberBloc memberBloc = MemberBloc();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<MemberBloc, MemberState>(
      bloc: memberBloc,
      listener: (context, state) {
        // TODO: implement listener
        if (state is MemberDialysistoPassword) {
          Navigator.push(context,
              MaterialPageRoute(builder: (ctx) => ConfirmPasswordScreen()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            height: size.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Text(
                  "Dialysis Status",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/on_boarding_images/Reminders-pana (2).png",
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * 0.4,
                              ),
                              Positioned(
                                child: Text(
                                  "Are you on Dialysis?",
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inversePrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )

                              //SizedBox(height: size.height*0.04,),
                              ,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Checkbox(
                                      value: value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      })
                                ],
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "No",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Checkbox(
                                      value: !value,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          this.value = !value!;
                                        });
                                      })
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  ElevatedButton(
                      onPressed: () {
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmPasswordScreen()));*/
                        int user=0;
                        memberBloc.add(MemberDialysisStatusEvent(
                          user: user,
                          dialysisStatus: [
                            MemberDialysisStatusModel(
                              dialysisStatus: value,
                            )
                          ],
                          
                         ));
                         user++;
                      },
                      child: const Row(
                        children: [
                          Text("Next"),
                          Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      )),
                ])

                //SizedBox(height: size.height*0.04,),
                // Text("Are you on Dialysis?",style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
          ),
        );
      },
    );
  }
}
