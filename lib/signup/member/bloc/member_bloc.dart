import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:vrikka/signup/member/models/member_sign_up_model.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {

  final int userId=0;
  List<myUser> memberSignUpModel = [];
  List<MemberBasicDetailsModel> memberBasicDetailsModel = [];
  List<MemberDietPreferencesModel> memberDietPreferencesModel = [];
  List<MemberDialysisStatusModel> memberDialysisStatusModel = [];
  List<MemberPasswordModel> memberPasswordModel = [];
  MemberBloc() : super(MemberInitial()) {
    on<MemberDetailsNextEvent>(memberDetailsNextEvent);
    on<MemberDietPreferencesEvent>(memberDietPreferencesEvent);
    on<MemberDialysisStatusEvent>(memberDialysisStatusEvent);
    on<MemberPasswordSelectEvent>(memberPasswordSelectEvent);
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<MemberSignUpEvent>(memberSignUpEvent);
  }
  FutureOr<void> memberPasswordSelectEvent(
      MemberPasswordSelectEvent event, Emitter<MemberState> emit) {
    memberPasswordModel.add(MemberPasswordModel(
      password: event.password[event.user].password,
    ));
    //memberSignUpModel[event.user].password = event.password[event.user].password;
    


    /*try {

      emit(MemberSignUpLoading());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "a@gmail.com", password: "123456")
          .then((value) => print(value.user!.uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }*/
      emit(MemberSignUpFailed());
    }

    
  

  FutureOr<void> memberSignUpEvent(
      MemberSignUpEvent event, Emitter<MemberState> emit) async {
    emit(MemberSignUpLoading());
    try {
      UserCredential user= await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(MemberSignUpFailed());
    }
  }

  FutureOr<void> memberDetailsNextEvent(
      MemberDetailsNextEvent event, Emitter<MemberState> emit) async{
     emit(MemberSignUpLoading());
   try {

      
     UserCredential user= await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: event.email, password: event.password);
          
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      emit(MemberSignUpFailed());
    }
    
    memberBasicDetailsModel.add(MemberBasicDetailsModel(
        name: event.name,
        username: event.username,
        email: event.email,
        phoneNumber: event.phoneNumber,
        password: event.password
    ));

    
    print(memberBasicDetailsModel.length);
    print(memberBasicDetailsModel[0].name);
    emit(MemberDetailstoDietPreferencesState());
  }

  FutureOr<void> memberDietPreferencesEvent(
      MemberDietPreferencesEvent event, Emitter<MemberState> emit) {
    memberDietPreferencesModel.add(MemberDietPreferencesModel(
      dietVeg: event.dietPreferences[event.user].dietVeg,
      dietNonVeg: event.dietPreferences[event.user].dietNonVeg,
      dietEggitarian: event.dietPreferences[event.user].dietEggitarian,
      dietVegan: event.dietPreferences[event.user].dietVegan,
      dietPescitarian: event.dietPreferences[event.user].dietPescitarian,
    ));
   /* memberSignUpModel[event.user].dietVeg = event.dietPreferences[event.user].dietVeg;
    memberSignUpModel[event.user].dietNonVeg = event.dietPreferences[event.user].dietNonVeg;
    memberSignUpModel[event.user].dietEggitarian = event.dietPreferences[event.user].dietEggitarian;
    memberSignUpModel[event.user].dietVegan = event.dietPreferences[event.user].dietVegan;
    memberSignUpModel[event.user].dietPescitarian = event.dietPreferences[event.user].dietPescitarian;*/

    emit(MemberDietPreferencestoDialysisStatusState());
  }

  FutureOr<void> memberDialysisStatusEvent(
      MemberDialysisStatusEvent event, Emitter<MemberState> emit) {
        
    memberDialysisStatusModel.add(MemberDialysisStatusModel(
      dialysisStatus: event.dialysisStatus[event.user].dialysisStatus,
    ));
    memberSignUpModel[event.user].dialysisStatus = event.dialysisStatus[event.user].dialysisStatus;
    memberSignUpModel.add( 
      myUser(name: memberBasicDetailsModel[event.user].name, 
      email: memberBasicDetailsModel[event.user].email,
      phoneNumber: memberBasicDetailsModel[event.user].phoneNumber, 
      dietVeg: memberDietPreferencesModel[event.user].dietVeg, 
      dietNonVeg: memberDietPreferencesModel[event.user].dietNonVeg, 
      dietEggitarian:memberDietPreferencesModel[event.user].dietEggitarian, 
      dietVegan: memberDietPreferencesModel[event.user].dietVegan, 
      dietPescitarian: memberDietPreferencesModel[event.user].dietPescitarian, 
      dialysisStatus: memberDialysisStatusModel[event.user].dialysisStatus, 
      username: memberBasicDetailsModel[event.user].username,)
    );
    emit(MemberDialysistoPassword());
    print("debugging starts here");
    print(memberSignUpModel.length);
    print(memberSignUpModel[0].name);
    print(memberSignUpModel[0].dialysisStatus);

    
  }

}
