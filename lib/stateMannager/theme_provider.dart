import 'package:flutter/material.dart';

enum SingingCharacter { turnOff, turnOn }

class ThemeProvider with ChangeNotifier {
  ThemeMode themeModeType = ThemeMode.light;
  SingingCharacter? character = SingingCharacter.turnOff;

  ThemeMode get themeMode {
    return themeModeType;
  }

  void setThemeModeLight() {
    themeModeType = ThemeMode.light;
    character = SingingCharacter.turnOff;
    notifyListeners();
  }

  void setThemeModeDark() {
    themeModeType = ThemeMode.dark;
    character = SingingCharacter.turnOn;
    notifyListeners();
  }
  // void toggleTheme() {
  //   themeModeType == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  //   notifyListeners();
  // }
}
