// ignore_for_file: public_member_api_docs, sort_constructors_first
class myUser {
  String name;
  String username;
  String email;
  String phoneNumber;
  bool dietVeg;
  bool dietNonVeg;
  bool dietEggitarian;
  bool dietVegan;
  bool dietPescitarian;
  bool dialysisStatus;
 // String password;
  myUser({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.dietVeg,
    required this.dietNonVeg,
    required this.dietEggitarian,
    required this.dietVegan,
    required this.dietPescitarian,
    required this.dialysisStatus,
  //  required this.password,
    required this.username
  });
  
}


class MemberBasicDetailsModel {
  String name;
  String username;
  String email;
  String phoneNumber;
  String password;
  MemberBasicDetailsModel({
    required this.name,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}
class MemberDietPreferencesModel {
  bool dietVeg;
  bool dietNonVeg;
  bool dietEggitarian;
  bool dietVegan;
  bool dietPescitarian;
  MemberDietPreferencesModel({
    required this.dietVeg,
    required this.dietNonVeg,
    required this.dietEggitarian,
    required this.dietVegan,
    required this.dietPescitarian,
  });
}
class MemberDialysisStatusModel {
  bool dialysisStatus;
  MemberDialysisStatusModel({
    required this.dialysisStatus,
  });
}
class MemberPasswordModel {
  String password;
  MemberPasswordModel({
    required this.password,
  });
}