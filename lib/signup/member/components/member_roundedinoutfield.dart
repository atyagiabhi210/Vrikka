import 'package:flutter/material.dart';
import 'package:vrikka/signup/member/components/member_textfieldcontainer.dart';

class MemberRoundedInputField extends StatelessWidget {
  final keyboardType;
  final String hintText;
  final IconData icon;
 // final ValueChanged<String> onChanged;
  final textController; 
  MemberRoundedInputField(
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
          keyboardType:keyboardType,
          controller: textController,
      //onChanged: onChanged,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          hintText: hintText,
          
          border: InputBorder.none),
    ));
  }
}