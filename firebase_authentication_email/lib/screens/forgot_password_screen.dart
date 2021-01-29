import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_app/widgets/layout.dart';

import '../auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  String _email = "";
  int _counter = 0;
  bool _hasSent = false;
  Auth _auth;

  @override
  void initState() {
    super.initState();
    this._auth = Auth();
  }

  _sendResetEmail() async {
    try {
      assert(this._email.isNotEmpty);
      await this._auth.forgetPassword(this._email);
      _counter = 60;
      Timer.periodic(Duration(seconds: 1), (t) {
        setState(() {
          _counter--;

          if (_counter == 0) {
            t.cancel();
          }
        });
      });
      setState(() {
        _hasSent = true;
      });

      _showMyDialog(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          'Send password reset email',
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
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      icon: const Icon(Icons.email),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  _raisedButton(
                    context,
                    this._hasSent,
                    _sendResetEmail,
                    this._counter,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!6
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Check your inbox!',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 24,
          ),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'The email has been sent. But it may take a minute to arrive.',
              ),
            ],
          ),
        ),
        contentTextStyle: TextStyle(color: Colors.grey[600]),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _raisedButton(
    BuildContext context, bool hasSent, Function onPressed, int counter) {
  return hasSent
      ? OutlinedButton.icon(
          onPressed: counter > 0 ? () {} : onPressed,
          icon: Icon(counter > 0 ? Icons.timer : Icons.refresh),
          label: Text(counter > 0 ? counter.toString() : "Send again"),
        )
      : RaisedButton.icon(
          icon: Icon(
            Icons.send,
            color: Colors.white,
            size: 18,
          ),
          color: Theme.of(context).accentColor,
          label: Text(
            "Send",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          onPressed: onPressed,
        );
}
