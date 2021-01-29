import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/screens/choose_authentication.dart';
import 'package:login_app/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      title: 'Login App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
      ),
      home: await getLandingPage(),
    ),
  );
}

Future<Widget> getLandingPage() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  return StreamBuilder<User>(
    stream: FirebaseAuth.instance.authStateChanges(),
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasData && (!snapshot.data.isAnonymous)) {
        return HomeScreen(user: snapshot.data);
      }
      return ChooseAuthenticationScreen();
    },
  );
}
