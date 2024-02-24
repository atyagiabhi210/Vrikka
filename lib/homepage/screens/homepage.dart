import 'package:flutter/material.dart';
import 'package:vrikka/chatbot/screens/chat_page.dart';
import 'package:vrikka/community/screens/community_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<BottomNavigationBarItem> bottomNavScreen=[
    BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chat Bot",),
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
    BottomNavigationBarItem(icon: Icon(Icons.chat_outlined), label: "Community",),
    BottomNavigationBarItem(icon: Icon(Icons.lock_clock), label: "Reminder",),
  ];
  void _onItemTapped(int index) {
    setState(() {
      this.index = index;
    });
  }
  final List<Widget> pages=[
    ChatbotPage(),
    Center(child: Text("Home"),),
    ChatScreen(),
    Center(child: Text("Reminder"),),
  ];
  
  @override
  Widget build(BuildContext context) {
    
    
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (index) {
              _onItemTapped(index);
            },
            items: bottomNavScreen
          ),
          appBar: AppBar(
            title: Text('HomePage'),
          ),
          body: pages[index],
        );
      }
    
  }

