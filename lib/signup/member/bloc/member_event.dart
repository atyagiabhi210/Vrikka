// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'member_bloc.dart';

@immutable
sealed class MemberEvent {}

class MemberInitialEvent extends MemberEvent{}
class MemberDetailsNextEvent extends MemberEvent {
  final user;
  final String name;
  final String email;
  final String username;
  final String phoneNumber;
  final String password;
  MemberDetailsNextEvent({
    required this.user,
   // required this.basicDetails,
    required this.name,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.password,
  });
  
}

class MemberDietPreferencesEvent extends MemberEvent {
  final int user;
  final List<MemberDietPreferencesModel> dietPreferences;
  MemberDietPreferencesEvent({
    required this.user,
    required this.dietPreferences,

  });
}
class MemberDialysisStatusEvent extends MemberEvent {
  final int user;
  final List<MemberDialysisStatusModel> dialysisStatus;
  MemberDialysisStatusEvent({
    required this.user,
    required this.dialysisStatus,
  });

}


class MemberPasswordSelectEvent extends MemberEvent {
  final int user;
  final List<MemberPasswordModel> password;
  MemberPasswordSelectEvent({
    required this.user,
    required this.password,
  });

}

class MemberSignUpEvent extends MemberEvent {

  final int user;
  final String email;
  final String password;
  //final List<MemberSignUpModel> memberSignUpModel;
  MemberSignUpEvent({
    required this.user,
    required this.email,
    required this.password,
    //required this.memberSignUpModel,
  });
}