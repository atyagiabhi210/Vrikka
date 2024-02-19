import 'package:flutter/material.dart';

class TextFieldContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TextFieldContainerState(child: child);
  }
  final Widget child;
  TextFieldContainer({super.key, required this.child});
 
}
class _TextFieldContainerState extends State<TextFieldContainer> {
  final Widget child;
  _TextFieldContainerState({ required this.child});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }}
