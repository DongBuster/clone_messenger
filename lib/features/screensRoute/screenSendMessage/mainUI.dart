import 'package:clone_messenger/common/avatarUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clone_messenger/api/apis.dart';
import 'package:clone_messenger/features/screensRoute/screenSendMessage/widgets/messageCard.dart';
import 'package:clone_messenger/buildWidget/widgetPublic.dart';
import 'package:clone_messenger/model/chatUser.dart';
import 'package:clone_messenger/model/messageModel.dart';
import 'package:flutter/widgets.dart';

// Route routeSendMessage() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => SendMessage(user,),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0, 3);
//       const end = Offset.zero;
//       const curve = Curves.easeInOut;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
// }

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});
  final ChatUser user;

  @override
  State<ChatScreen> createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  List<Messages> _list = [];

  late FocusNode myFocusNode;
  late FocusNode myFocusNode2;

  final myController = TextEditingController();
  final myController2 = TextEditingController();
  ScrollController listScrollController = ScrollController();

  double width3 = 0;
  double widthtru = 0;
  double heightInput2 = 0;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    myFocusNode2 = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    myFocusNode2.dispose();
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    double width2 = width - 160;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromARGB(255, 221, 245, 255),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //header
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.blue[800],
                          size: 18,
                        ),
                      ),
                      AvatarUser(
                        link: widget.user.image,
                        isOnline: widget.user.isOnline,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.user.name,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.call,
                          color: Colors.blue[800],
                          size: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.video_call,
                          color: Colors.blue[800],
                          size: 18,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(right: 10),
                        onPressed: null,
                        icon: Icon(
                          Icons.info,
                          color: Colors.blue[800],
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //list message
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() {
                  myFocusNode.unfocus();
                  heightInput2 = 0;
                  width3 = 0;
                }),
                child: SingleChildScrollView(
                  controller: listScrollController,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        child: const Text(
                          'Say Hii! 👋',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      StreamBuilder(
                        stream: APIs.getAllMessages(widget.user),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            // if data is loading
                            case ConnectionState.waiting:
                            case ConnectionState.none:

                            //if some data or all data is loaded then show it
                            case ConnectionState.active:
                            case ConnectionState.done:
                              final data = snapshot.data?.docs;
                              // debugPrint(
                              //     'Data: ${jsonEncode(data![0].data())}');
                              _list = data
                                      ?.map((e) => Messages.fromJson(e.data()))
                                      .toList() ??
                                  [];
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                listScrollController.animateTo(
                                  listScrollController.position.maxScrollExtent,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.linear,
                                );
                              });

                              if (_list.isNotEmpty) {
                                return Column(
                                  children: _list
                                      .map((e) => MessageCard(messages: e))
                                      .toList(),
                                );
                              } else {
                                return const SizedBox();
                              }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              // ),
            ),
            Stack(
              children: [
                // input1
                Container(
                  color: Colors.white,
                  height: 50,
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.image,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.mic_rounded,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: width - 160,
                        height: 40,
                        child: TextField(
                          controller: myController,
                          onChanged: (value) => setState(() {
                            heightInput2 = 50;
                            widthtru = 80;
                            width3 = width;
                            myFocusNode.requestFocus();
                          }),
                          onTap: () => setState(() {
                            heightInput2 = 50;
                            widthtru = 80;
                            width3 = width;
                            myFocusNode.requestFocus();
                          }),
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w500),
                          focusNode: myFocusNode,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.tag_faces,
                                color: Colors.blue,
                                size: 22,
                              ),
                              hintText: 'Nhắn tin',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                              filled: true,
                              fillColor: Colors.white24,
                              contentPadding:
                                  const EdgeInsets.only(left: 15, right: 10),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(40))),
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.thumb_up,
                          size: 20,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                // input 2
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.white,
                    width: width3,
                    height: heightInput2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: IconButton(
                                    onPressed: () => setState(() {
                                      heightInput2 = 0;
                                      width3 = 0;
                                      myFocusNode2.unfocus();
                                    }),
                                    icon: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: width2 + widthtru,
                                  height: 40,
                                  child: TextFormField(
                                    controller: myController,
                                    focusNode: myFocusNode,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                        suffixIcon: const Icon(
                                          Icons.tag_faces,
                                          color: Colors.blue,
                                          size: 18,
                                        ),
                                        hintText: 'Nhắn tin',
                                        hintStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500),
                                        filled: true,
                                        fillColor: Colors.white24,
                                        contentPadding: const EdgeInsets.only(
                                            left: 15, right: 10),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                  ),
                                ),
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 40,
                              height: 40,
                              child: IconButton(
                                onPressed: () {
                                  if (myController.text.isNotEmpty) {
                                    APIs.SendMessage(
                                        widget.user, myController.text);
                                    myController.text = '';
                                  }
                                  setState(() {
                                    width3 = 0;
                                    heightInput2 = 0;
                                    myFocusNode.unfocus();
                                    myFocusNode2.unfocus();

                                    // Send_Message(myController.text);
                                    myController.clear();
                                  });
                                },
                                icon: const Icon(
                                  Icons.send,
                                  size: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Expanded(
//   child: GestureDetector(
//     onTap: () => setState(() {
//       myFocusNode.unfocus();
//       heightInput2 = 0;
//       width3 = 0;
//     }),
//     child:

// return ListView.builder(
//   // physics:
//   //     const NeverScrollableScrollPhysics(),
//   scrollDirection: Axis.vertical,
//   // padding: const EdgeInsets.only(top: 50),
//   controller: listScrollController,
//   itemCount: _list.length,
//   itemBuilder: ((context, index) {
//     return MessageCard(
//         messages: _list[index]);
//   }),
// );


//     Positioned(
            //       top: 0,
            //       left: 0,
            //       right: 0,
            //       child:
            // Container(
            //         color: Colors.white,
            //         width: MediaQuery.of(context).size.width,
            //         height: 50,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Row(
            //               children: [
            //                 IconButton(
            //                   onPressed: () {
            //                     Navigator.pop(context);
            //                   },
            //                   icon: Icon(
            //                     Icons.arrow_back,
            //                     color: Colors.blue[800],
            //                     size: 18,
            //                   ),
            //                 ),
            //                 AvatarUser(
            //                   link: widget.user.image,
            //                   isOnline: widget.user.isOnline,
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 10),
            //                   child: Text(
            //                     widget.user.name,
            //                     style: const TextStyle(
            //                       fontSize: 16,
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 IconButton(
            //                   onPressed: null,
            //                   icon: Icon(
            //                     Icons.call,
            //                     color: Colors.blue[800],
            //                     size: 18,
            //                   ),
            //                 ),
            //                 IconButton(
            //                   onPressed: null,
            //                   icon: Icon(
            //                     Icons.video_call,
            //                     color: Colors.blue[800],
            //                     size: 18,
            //                   ),
            //                 ),
            //                 IconButton(
            //                   padding: const EdgeInsets.only(right: 10),
            //                   onPressed: null,
            //                   icon: Icon(
            //                     Icons.info,
            //                     color: Colors.blue[800],
            //                     size: 18,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
