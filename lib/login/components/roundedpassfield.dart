import 'package:flutter/material.dart';
import 'package:vrikka/login/components/textfieldcontainer.dart';

class RoundedInputPassField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final textController;

  RoundedInputPassField(
      {super.key,
      required this.hintText,
      this.icon = Icons.lock,
      required this.textController,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFieldContainer(
        child: TextField(
            obscureText: true,
            onChanged: onChanged,
            decoration: InputDecoration(
                icon: Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                ),
                hintText: hintText,
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.visibility,
                  color: Theme.of(context).primaryColor,
                ))));
  }
}

