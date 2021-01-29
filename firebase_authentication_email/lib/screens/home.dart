import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_app/auth.dart';
import 'package:login_app/screens/choose_authentication.dart';
import 'package:login_app/widgets/layout.dart';

class HomeScreen extends StatefulWidget {
  final User user;

  const HomeScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Auth _auth;

  @override
  void initState() {
    super.initState();
    _auth = Auth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Layout(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              this.widget.user.photoURL.runtimeType == String
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        this.widget.user.photoURL,
                      ),
                      radius: 60,
                      backgroundColor: Colors.transparent,
                    )
                  : SizedBox(),
              SizedBox(height: 40),
              Text(
                'NAME',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              this.widget.user.displayName.runtimeType == String
                  ? Text(
                      this.widget.user.displayName,
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  : SizedBox(),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              this.widget.user.email.runtimeType == String
                  ? Text(
                      this.widget.user.email,
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),
                    )
                  : SizedBox(),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => ChooseAuthenticationScreen(),
                    ),
                    ModalRoute.withName('/'),
                  );
                },
                color: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
