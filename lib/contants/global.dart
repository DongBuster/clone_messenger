import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.white,
  hintColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color.fromARGB(255, 233, 233, 233),
      hintStyle: TextStyle(color: Colors.grey[900]),
      suffixIconColor: Colors.black26),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: Colors.black54,
    unselectedIconTheme: IconThemeData(color: Colors.black54),
  ),
);
final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.black,
  hintColor: Colors.blue,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.white,
      unselectedIconTheme: IconThemeData(color: Colors.white)),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color.fromARGB(115, 33, 30, 30),
    hintStyle: const TextStyle(color: Colors.grey),
    suffixIconColor: Colors.grey,
  ),
);

const List<dynamic> dataTest = [
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Hoang',
    "subtitle": 'Cuộc gọi nhỡ',
    "timeDate": '9/10',
    "icon1": null,
    "iconSub": Icons.call,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Em Nam',
    "subtitle": 'Cuộc gọi đi',
    "timeDate": '10/10',
    "icon1": null,
    "iconSub": Icons.call_sharp,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'NYC',
    "subtitle": 'Cuộc gọi nhỡ',
    "timeDate": '20/10',
    "icon1": null,
    "iconSub": Icons.call,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Bố',
    "subtitle": 'Cuộc gọi đi',
    "timeDate": '30/10',
    "icon1": null,
    "iconSub": Icons.call_sharp,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Mẹ',
    "subtitle": 'Cuộc gọi đi',
    "timeDate": '30/10',
    "icon1": null,
    "iconSub": Icons.call_sharp,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Bạn thân',
    "subtitle": 'Cuộc gọi nhỡ',
    "timeDate": '1/11',
    "icon1": null,
    "iconSub": Icons.call,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Su',
    "subtitle": 'Cuộc gọi nhỡ',
    "timeDate": '9/10',
    "icon1": null,
    "iconSub": Icons.call,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Mai Van Tai',
    "subtitle": 'Cuộc gọi đi',
    "timeDate": '21/11',
    "icon1": null,
    "iconSub": Icons.call_sharp,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Duy đại',
    "subtitle": 'Cuộc gọi đi',
    "timeDate": '9/10',
    "icon1": null,
    "iconSub": Icons.call_sharp,
    "icon2": Icons.call,
  },
  {
    "image":
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
    "title": 'Bé cute',
    "subtitle": 'Cuộc gọi nhỡ',
    "timeDate": '1/1',
    "icon1": null,
    "iconSub": Icons.call,
    "icon2": Icons.call,
  },
];
