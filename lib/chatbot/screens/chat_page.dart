import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrikka/chatbot/bloc/chat_bloc.dart';
import 'package:vrikka/chatbot/models/chat.dart';


class ChatbotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatbotPageState();
  }
}

class _ChatbotPageState extends State<ChatbotPage> {

  final ChatBloc chatBloc = ChatBloc();
  final chatControler = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    chatControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: body(
        child: BlocConsumer<ChatBloc, ChatState>(
          bloc: chatBloc,
          listener: (context, state) {
          },
          builder: (context, state) {
             switch (state.runtimeType) {
              // ignore: type_literal_in_constant_pattern
              case ChatSuccessState:
              List<ChatMessageModel> messages=
              (state as ChatSuccessState).messages;
              return Column(
              children: [
                SizedBox(height: size.height * 0.05),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Chatbot",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Expanded(child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder:(context,index){
                  return Container(
                    margin:const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: messages[index].role=="user"?Colors.blueAccent:Colors.amberAccent, 
                    ),

                    padding:const EdgeInsets.all(16),
                    child: Text(messages[index].parts.first.text),
                  );
                })),
                Container(
                  padding:const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: chatControler,
                          decoration: InputDecoration(
                              hintText: "Send a message...",
                              hintStyle:const TextStyle(color: Colors.blueAccent),
                              enabledBorder: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                   const BorderSide(color: Colors.blueAccent),
                              )),
                        ),
                      ),
                      IconButton(
                        icon:const Icon(Icons.send),
                        onPressed: () {
                          if (chatControler.text.isNotEmpty) {
                            String inputMessage = chatControler.text;
                            chatControler.clear();
                            chatBloc.add(ChatGenerateNewTextMessageEvent(inputMessage: inputMessage));
                                
                                print(inputMessage);
                                print(messages.length);
                          }
                          
                          //chatControler.clear();
                        },
                      )
                    ],
                  ),
                )
              ],
            );
              
            default:
                return Container();
            }
          },
        ),
      ),
    );
  }
}

class body extends StatelessWidget {
  final child;
  const body({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              child: Image.asset("assets/images/main_top.png",
                  width: size.width * 0.3)),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(
                "assets/images/login_bottom.png",
              )),
          Center(
            child: Image.asset(
              "assets/images/vrikka_logo.png",
              height: size.height * 0.2,
            ),
          ),
          child,
          // SvgPicture.asset("assets/icons/login.svg",height: size.height*0.2,)
        ],
      ),
    );
  }
}
