import 'package:clone_messenger/features/pages/callLogs/mainUi.dart';
import 'package:flutter/material.dart';
import '../features/pages/homePage/mainUI.dart';
import '../features/pages/newsFriendly/mainUI.dart';
import '../features/pages/phoneBooks/mainUI.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHome();
}

class _AppHome extends State<AppHome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      ChatPage(),
      const CallLogs(),
      const PhoneBooks(),
      const NewsFriendly()
    ];
    return Scaffold(
        body: SafeArea(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedIconTheme:
              Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
          selectedIconTheme: const IconThemeData(color: Colors.blue),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.message_sharp, size: 20),
              label: 'Đoạn chat',
              // backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_call_sharp, size: 20),
              label: 'Cuộc gọi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people_alt_sharp, size: 20),
              label: 'Danh bạ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pages, size: 20),
              label: 'Tin',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
