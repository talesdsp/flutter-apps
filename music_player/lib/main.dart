import 'package:flutter/material.dart';
import 'package:music_player/screens/playing_screen/playing_screen.dart';
import 'package:music_player/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musiké',
      debugShowCheckedModeBanner: false,
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      // themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
      home: PlayingScreen(),
    );
  }
}
