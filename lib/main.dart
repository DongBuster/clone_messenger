import 'dart:async';
import 'package:clone_messenger/contants/global.dart';
import 'package:flutter/material.dart';
import 'package:clone_messenger/mainTrees/App_trees.dart';
//Providers
import 'package:provider/provider.dart';
import 'stateMannager/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';

//global object for accessing device screen size
late Size mq;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // name: "chat-app",
      // options: DefaultFirebaseOptions.currentPlatform;
      options: const FirebaseOptions(
          apiKey: "AIzaSyDoXsZdlqisde5LJsCEc6Rpyr7lB6jd05Y",
          authDomain: "chat-app-b9063.firebaseapp.com",
          projectId: "chat-app-b9063",
          storageBucket: "chat-app-b9063.appspot.com",
          messagingSenderId: "408619027605",
          appId: "1:408619027605:web:76ff2993efaf6b0e605f9c"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (ctx, themeObject, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Messenger',
          themeMode: themeObject.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const SafeArea(child: AppTrees()),
        ),
      ),
    );
  }
}
