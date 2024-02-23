part of 'member_bloc.dart';

@immutable
sealed class MemberState {}

final class MemberInitial extends MemberState {}
abstract class MemberActionState extends MemberState{}
class MemberSignUpLoadingState extends MemberState{}
class MemberSignUpSucessState extends MemberState{}
class MemberSignUpErrorState extends MemberState{}

class MemberDetailstoDietPreferencesState extends MemberActionState {}
class MemberDietPreferenceSelectedBuildState extends MemberState{}
class MemberDietPreferencestoDialysisStatusState extends MemberActionState {}

class MemberDialysistoPassword extends MemberActionState {}

class MemberSignUpLoading extends MemberActionState{}
class MemberSignUpSuccess extends MemberActionState{}
class MemberSignUpFailed extends MemberActionState{}
