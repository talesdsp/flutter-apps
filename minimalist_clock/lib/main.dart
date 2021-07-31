import 'package:flutter/material.dart';
import 'package:minimalist_clock/providers/theme_provider.dart';
import 'package:minimalist_clock/screens/home/home_screen.dart';
import 'package:minimalist_clock/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, theme, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeData(context),
            darkTheme: darkThemeData(context),
            themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
