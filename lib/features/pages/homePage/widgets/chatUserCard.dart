import 'package:clone_messenger/common/avatarUser.dart';
import 'package:clone_messenger/stateMannager/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:clone_messenger/model/chatUser.dart';
import 'package:clone_messenger/features/screensRoute/screenSendMessage/mainUI.dart';
import 'package:provider/provider.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;
  const ChatUserCard({super.key, required this.user});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => ChatScreen(user: widget.user))),
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AvatarUser(
                    link: widget.user.image, isOnline: widget.user.isOnline),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color:
                            Provider.of<ThemeProvider>(context, listen: false)
                                        .themeMode ==
                                    ThemeMode.light
                                ? Colors.black
                                : Colors.white,
                      ),
                    ),
                    const Text(
                      'ok',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.circle,
                size: 13,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
