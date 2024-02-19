import 'package:flutter/material.dart';

class MemberTextFieldContainer extends StatefulWidget {
  final child;
  MemberTextFieldContainer({Key? key, required this.child}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MemberTextFieldContainerState(child: child);
  }
}
class _MemberTextFieldContainerState extends State<MemberTextFieldContainer> {

  final child;
  _MemberTextFieldContainerState({required this.child});

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(29)),
      child: child,
    );
  }
}
