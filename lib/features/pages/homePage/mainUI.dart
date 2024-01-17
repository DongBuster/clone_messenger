import 'package:clone_messenger/common/avatarUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clone_messenger/api/apis.dart';
import 'package:clone_messenger/features/pages/homePage/widgets/chatUserCard.dart';
import 'package:clone_messenger/features/screensRoute/screenUser.dart';
import '../../auth/services/auth.dart';
import '../../../model/chatUser.dart';

class ChatPage extends StatefulWidget {
  final User? user = Auth().currentUser;

  ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final User? user = Auth().currentUser;

  List<ChatUser> list = [];
  List<ChatUser> searchList = [];
  bool isSearch = false;

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileScreen(user: APIs.me))),
                  child: AvatarUser(link: APIs.me.image, isOnline: 'false'),
                ),
                const Text(
                  'Message',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                iconHeader(context)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 15, 20, 20),
                    height: 35,
                    child: TextFormField(
                      cursorColor: Colors.blue,
                      controller: myController,
                      style: const TextStyle(fontSize: 15),
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                        ),
                        hintText: 'Enter a search term',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        filled: true,
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                      ),
                      onTap: () {
                        setState(() {
                          isSearch = !isSearch;
                        });
                      },
                      onTapOutside: (PointerDownEvent event) {
                        FocusScope.of(context).unfocus();
                        myController.text = '';
                        isSearch = false;
                      },
                      onChanged: (value) {
                        searchList.clear();
                        for (var i in list) {
                          if (i.name
                              .toLowerCase()
                              .contains(value.toLowerCase())) {
                            searchList.add(i);
                          }
                          setState(() {
                            searchList;
                          });
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    height: 40,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: APIs.getAllUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }

                        switch (snapshot.connectionState) {
                          // if data is loading
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                          // return const Center(
                          //   child: CircularProgressIndicator(),
                          // );
                          //if some data or all data is loaded then show it
                          case ConnectionState.active:
                          case ConnectionState.done:
                            final data = snapshot.data?.docs;
                            list = data
                                    ?.map((e) => ChatUser.fromJson(
                                        e.data() as Map<String, dynamic>))
                                    .toList() ??
                                [];
                            int flag = 0;
                            for (var i = 0; i < list.length; i++) {
                              if (list[i].isOnline == 'true') {
                                dynamic temp = list[i];
                                list[i] = list[flag];
                                list[flag] = temp;
                                flag++;
                              }
                            }
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: list.length,
                              itemBuilder: (context, index) {
                                return AvatarUser(
                                  link: list[index].image,
                                  isOnline: list[index].isOnline,
                                );
                              },
                            );
                        }
                      },
                    ),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: APIs.getAllUsers(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        switch (snapshot.connectionState) {
                          // if data is loading
                          case ConnectionState.waiting:
                          case ConnectionState.none:
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          //if some data or all data is loaded then show it
                          case ConnectionState.active:
                          case ConnectionState.done:
                            final data = snapshot.data?.docs;
                            list = data
                                    ?.map((e) => ChatUser.fromJson(
                                        e.data() as Map<String, dynamic>))
                                    .toList() ??
                                [];

                            if (list.isNotEmpty) {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    isSearch ? searchList.length : list.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  // return Text(list[index].isOnline);
                                  return ChatUserCard(
                                    user: isSearch
                                        ? searchList[index]
                                        : list[index],
                                  );
                                }),
                              );
                            } else {
                              return const Center(
                                child: Text(
                                  'No Connections found!',
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            }
                        }
                      }),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

final List<Map<String, String>> datas = [
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fcute.jfif?alt=media&token=e4497996-6bb9-4078-9827-cdfd287936c2",
    "name": "Em bé",
    "id": "001",
    "isOnline": "false",
    "email": "BeBecute@gmail.com",
    "about": "",
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fnam1.jfif?alt=media&token=bafc13f0-8374-4ce9-b348-da68c6f8f83b",
    "name": "Phạm Bằng",
    "id": "002",
    "isOnline": "false",
    "email": "PhamBang@gmail.com",
    "about": "",
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fnam2.jfif?alt=media&token=f9252d3e-4329-4b76-b9df-1f4219d63459",
    "name": "Gojo Starou",
    "id": "003",
    "isOnline": "false",
    "email": "Gojo@gmail.com",
    "about": "",
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fnu1.jpg?alt=media&token=8b2a2e88-f068-4211-9d7c-3d83796a3a02",
    "name": "Mai Thảo",
    "id": "004",
    "isOnline": "false",
    "email": "ThuThao@gmail.com",
    "about": "",
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fnu2.jpg?alt=media&token=9596b428-c395-4601-99ac-327ed47e7339",
    "name": "Thu Tuyết",
    "id": "005",
    "isOnline": "false",
    "email": "ThuTuyet@gmail.com",
    "about": "",
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fnu3.jpg?alt=media&token=7bfabd99-e9da-46e9-bbc1-06662e8eb031",
    "name": "Phạm Linh ",
    "id": "006",
    "isOnline": "false",
    "email": "PhamLinh@gmail.com",
    "about": "",
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fnu4.jfif?alt=media&token=776555f9-cf29-408a-80ac-926fdfbe455b",
    "name": "Thu Trang",
    "id": "007",
    "isOnline": "false",
    "email": "ThuTrang@gmail.com",
    "about": "",
  },
  {
    "image":
        "https://firebasestorage.googleapis.com/v0/b/chat-app-b9063.appspot.com/o/profile_picture%2Fsoaica.jpg?alt=media&token=1e6031cc-0090-45e0-9bff-f004b2aee52d",
    "name": "Hoàng Nam",
    "id": "008",
    "isOnline": "false",
    "email": "HoangNam@gmail.com",
    "about": "",
  },
];

Widget iconHeader(BuildContext context) {
  return Wrap(
    spacing: 15.0,
    children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black12,
        ),
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(0),
        width: 30,
        height: 30,
        child: Center(
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Theme.of(context).hintColor,
            ),
            iconSize: 18,
            padding: const EdgeInsets.all(0),
            // color: Theme.of(context).hintColor,
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black12,
        ),
        width: 30,
        height: 30,
        child: Center(
          child: IconButton(
            onPressed: () {
              print('click');
              for (var i = 0; i < datas.length; i++) {
                APIs.AddUser(datas[i]);
              }
              // datas.map((e) => APIs.AddUser(e));
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const LocalDB()));
            },
            icon: const Icon(Icons.post_add_sharp),
            iconSize: 18,
            padding: const EdgeInsets.all(0),
            color: Theme.of(context).hintColor,
          ),
        ),
      ),
    ],
  );
}
