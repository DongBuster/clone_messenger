import 'package:flutter/material.dart';
import 'package:clone_messenger/features/auth/screens/login_register_page.dart';
import 'AppHome.dart';
import '../features/auth/services/auth.dart';

class AppTrees extends StatefulWidget {
  const AppTrees({super.key});

  @override
  State<AppTrees> createState() => _AppTreesState();
}

class _AppTreesState extends State<AppTrees> {
  @override
  Widget build(BuildContext context) {
    // return MyStatefulWidget();
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return const AppHome();
        } else {
          return const loginPage();
        }
      },
    );
  }
}
