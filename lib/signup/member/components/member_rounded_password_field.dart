import 'package:flutter/material.dart';
import 'package:vrikka/signup/member/components/member_textfieldcontainer.dart';

class MemberRoundedPasswordField extends StatelessWidget {
  final keyboardType;
  final String hintText;
  final IconData icon;
 // final ValueChanged<String> onChanged;
  final textController; 
  MemberRoundedPasswordField(
      {super.key,
      required this.keyboardType,
      required this.hintText,
      required this.icon,
   //   required this.onChanged,
      required this.textController});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MemberTextFieldContainer(
      
        child: TextField(
          obscureText: true,
          keyboardType:keyboardType,
          controller: textController,
      //onChanged: onChanged,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          hintText: hintText,
          suffixIcon: Icon(
            Icons.visibility,
            color: Theme.of(context).primaryColor,
          ),
          border: InputBorder.none),
    ));
  }
}