import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/img.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.withOpacity(.3),
                          kPrimaryColor.withOpacity(.8)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black12, Colors.black26],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon:
                                    Icon(Icons.ios_share, color: Colors.white),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: SvgPicture.asset('assets/icons/more.svg',
                                    color: Colors.white),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          'assets/images/img.png',
                          fit: BoxFit.cover,
                          width: 120,
                          height: 120,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "@jenny_s",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "\"Don't stop beleafing\"",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.palette),
              title: Text('Theme'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.star, color: Colors.blue.withOpacity(.6)),
              title: Text(
                'Premium',
                style: TextStyle(color: Colors.blue.withOpacity(.6)),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.chrome_reader_mode_outlined),
              title: Text('Licenses'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationVersion: "1.1",
                  applicationLegalese: "See more about us here",
                );
              },
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

Widget _dialogTile() {
  return Container(
    color: kBackgroundColor,
    child: Text("oi"),
  );
}
