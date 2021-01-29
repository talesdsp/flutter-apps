import 'package:flutter/material.dart';
import 'package:login_app/auth.dart';
import 'package:login_app/screens/forgot_password_screen.dart';
import 'package:login_app/screens/home.dart';
import 'package:login_app/widgets/layout.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";
  Auth auth;
  bool isPasswordVisible = true;

  @override
  void initState() {
    super.initState();
    this.auth = Auth();
  }

  _createAccount() {
    this
        .auth
        .firebaseAuth
        .createUserWithEmailAndPassword(email: _email, password: _password)
        .then((credential) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(user: credential.user)));
    }).catchError((e, s) {
      print(s);
    });
  }

  _loginAccount() {
    this
        .auth
        .firebaseAuth
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((credential) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(user: credential.user)));
    }).catchError((e, s) {
      print(e);
      print(s);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Create your account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Layout(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                height: 310,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 8,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          icon: Icon(Icons.email),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value.trim();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        obscureText: isPasswordVisible,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                            ),
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value.trim();
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceEvenly,
                      buttonMinWidth: 120,
                      buttonHeight: 40,
                      children: [
                        raisedButton(context, 'Register', _createAccount),
                        raisedButton(context, 'Login', _loginAccount),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "forgot password",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget raisedButton(ctx, _text, _onPressed) {
  return RaisedButton(
    color: Theme.of(ctx).accentColor,
    child: Text(
      _text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    onPressed: _onPressed,
  );
}
