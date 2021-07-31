import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel/models/friend_model.dart';
import 'package:travel/screens/account/widgets/friends.dart';
import 'package:travel/screens/account/widgets/statistics.dart';
import 'package:travel/widgets/index.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.all(8),
              shape: CircleBorder(),
            ),
            child: RotatedBox(
              quarterTurns: -1,
              child: Icon(
                Icons.double_arrow_rounded,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          ClipShadowPath(
            shadow: Shadow(color: Colors.black, blurRadius: 10),
            clipper: SClipper(height: 20),
            child: Stack(
              children: [
                Container(
                  height: 350,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/santorini.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black26, Colors.black54],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 55,
                        backgroundImage: AssetImage(
                          "assets/images/stmarksbasilica.jpg",
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomPaint(
                        painter: UnderlinePainter(color: Color(0xFFD8ECF1)),
                        child: Text(
                          "Hi, Josh",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Statistics(),
          Friends(friends: friends),
        ],
      ),
    );
  }
}
