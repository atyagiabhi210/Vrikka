import 'package:flutter/material.dart';



  class BottomNavbar extends StatefulWidget{
    final int index;

  const BottomNavbar({super.key, required this.index});
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavbar(index: index);
  }
  }

class _BottomNavbar extends State<BottomNavbar>{
  final int index;
  _BottomNavbar({required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return  
    NavigationBar(
    height: 80,
    elevation: 0,
    selectedIndex: index,
    onDestinationSelected: (index){
      index = index;
    },
      destinations: [
        NavigationDestination(icon: Icon(Icons.chat_bubble), label: "Chat Bot",),
        NavigationDestination(icon: Icon(Icons.chat_outlined), label: "Community",),
        NavigationDestination(icon: Icon(Icons.lock_clock), label: "Reminder",),],
    );
}
}