import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrikka/signup/member/bloc/member_bloc.dart';
import 'package:vrikka/signup/member/models/member_sign_up_model.dart';
import 'package:vrikka/signup/member/screens/member_dialysis_status.dart';

class DietPrefrences extends StatefulWidget {
  
  @override
  State<DietPrefrences> createState() {
    return _DietPrefrencesState();
  }
}

class _DietPrefrencesState extends State<DietPrefrences> {
  bool value = false;
  bool dietVeg = false;
  bool dietNonVeg = false;
  bool dietEggitarian = false;
  bool dietPescitarian = false;
  bool dietVegan = false;
  final MemberBloc memberBloc = MemberBloc();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<MemberBloc, MemberState>(
      bloc: memberBloc,
      listener: (context, state) {
        // TODO: implement listener
        if(state is MemberDietPreferencestoDialysisStatusState){
          Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MemberDialysisStatus()));
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Dbackground(
          size: size,
          child: SingleChildScrollView(
              child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Your Diet Preferences",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Veg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Checkbox(
                            value: dietVeg,
                            onChanged: (bool? value) {
                              setState(() {
                                dietVeg = !dietVeg;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Non Veg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Checkbox(
                            value: dietNonVeg,
                            onChanged: (value) {
                              // dietVeg=!dietVeg;
                              setState(() {
                                dietNonVeg = !dietNonVeg;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Eggitarian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Checkbox(
                            value: dietEggitarian,
                            onChanged: (bool? value) {
                              setState(() {
                                dietEggitarian = !dietEggitarian;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Pescitarian",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Checkbox(
                            value: dietPescitarian,
                            onChanged: (bool? value) {
                              setState(() {
                                dietPescitarian = !dietPescitarian;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Vegan",
                            style: TextStyle(
                                color: Colors.cyan,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Checkbox(
                            value: dietVegan,
                            onChanged: (bool? value) {
                              setState(() {
                                dietVegan = !dietVegan;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 20,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      //Navigator.push(context, MaterialPageRoute(builder: (context) => DietPrefrences()));
                                    },
                                    child: const Row(
                                      children: [
                                        Icon(Icons.arrow_back_ios_rounded),
                                        Text("Back"),
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 20,
                                ),
                                child: ElevatedButton(
                                    onPressed: () {
                                      int user = 0;
                                      memberBloc.add(MemberDietPreferencesEvent(
                                        user:user,
                                          dietPreferences: [
                                            MemberDietPreferencesModel(
                                                dietVeg: dietVeg,
                                                dietNonVeg: dietNonVeg,
                                                dietEggitarian: dietEggitarian,
                                                dietVegan: dietVegan,
                                                dietPescitarian: dietPescitarian)
                                          ]));
                                          user++;

                                    },
                                    child: const Row(
                                      children: [
                                        Text("Next"),
                                        Icon(Icons.arrow_forward_ios_rounded)
                                      ],
                                    )),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
        ));
      },
    );
  }
}

class Dbackground extends StatelessWidget {
  final child;
  const Dbackground({
    super.key,
    required this.size,
    required this.child,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            opacity: const AlwaysStoppedAnimation(.8),
            "assets/images/on_boarding_images/Eating healthy food-pana.png",
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          child
        ],
      ),
    );
  }
}
