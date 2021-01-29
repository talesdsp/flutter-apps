import 'package:flutter/material.dart';
import 'package:login_app/auth.dart';
import 'package:login_app/screens/home.dart';
import 'package:login_app/screens/login.dart';
import 'package:login_app/widgets/layout.dart';

class ChooseAuthenticationScreen extends StatelessWidget {
  Function _signWithGoogle(context) {
    return () async {
      final _auth = Auth();
      try {
        final user = await _auth.signInWithGoogle();

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(user: user),
          ),
        );
      } catch (e) {
        print("Google auth cancelled");
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        child: Stack(
          children: [
            Center(
              heightFactor: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _signInButton(
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    [
                      Icon(
                        Icons.login,
                        color: Colors.blue,
                        size: 24,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Sign in with email",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  _signInButton(
                    _signWithGoogle(context),
                    [
                      Image(
                        image: AssetImage("assets/images/google-logo.jpg"),
                        height: 30.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _signInButton(Function _onPressed, List<Widget> _children) {
  return FlatButton(
    splashColor: Colors.grey,
    height: 50,
    minWidth: 300,
    color: Colors.white,
    onPressed: _onPressed,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[..._children],
      ),
    ),
  );
}
