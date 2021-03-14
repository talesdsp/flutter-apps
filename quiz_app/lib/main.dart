import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/quiz/quiz_bindings.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:quiz_app/screens/score/score_bindings.dart';
import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:quiz_app/screens/welcome/welcome_bindings.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "/welcome",
      defaultTransition: Transition.native,
      getPages: [
        GetPage(
          name: '/welcome',
          page: () => WelcomeScreen(),
          binding: WelcomeBindings(),
        ),
        GetPage(
          name: '/quiz',
          page: () => QuizScreen(),
          binding: QuizBindings(),
        ),
        GetPage(
          name: '/score',
          page: () => ScoreScreen(),
          binding: ScoreBindings(),
        ),
      ],
    );
  }
}
