import 'package:flutter/material.dart';
import 'package:vrikka/login/components/textfieldcontainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final textController; 
  RoundedInputField(
      {super.key,
      required this.hintText,
      this.icon = Icons.person,
      required this.onChanged,
      required this.textController});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFieldContainer(
        child: TextField(
          controller: textController,
      onChanged: onChanged,
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