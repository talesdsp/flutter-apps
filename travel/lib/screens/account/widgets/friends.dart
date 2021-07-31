import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:travel/models/friend_model.dart';

class Friends extends StatelessWidget {
  final List<Friend> friends;

  const Friends({Key key, this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Friends",
          style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.black87,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(height: 30),
        Container(
          height: 240,
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 20, top: 20),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            clipBehavior: Clip.none,
            itemCount: this.friends.length,
            itemBuilder: (context, index) => FriendItem(
              friend: this.friends[index],
              position: index + 1,
            ),
          ),
        ),
      ],
    );
  }
}

class FriendItem extends StatelessWidget {
  final Friend friend;
  final int position;

  const FriendItem({Key key, this.friend, this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 20),
          margin: const EdgeInsets.only(right: 15),
          child: Column(
            children: [
              CircleAvatar(
                maxRadius: 35,
                backgroundImage: AssetImage(this.friend.imageUrl),
              ),
              SizedBox(height: 5),
              Text(
                this.friend.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                '${this.friend.xp}xp',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        _buildPosition(this.position),
      ],
    );
  }
}

Widget _buildPosition(int position) {
  List<Color> _colors;
  String _rank;

  if (position == 1) {
    _rank = '1ST';
    _colors = [
      Colors.yellow[200],
      Colors.orange,
    ];
  } else if (position == 2) {
    _rank = '2ND';
    _colors = [
      Colors.grey[50],
      Colors.grey,
    ];
  } else if (position == 3) {
    _rank = '3RD';
    _colors = [
      Colors.amber[300],
      Colors.brown,
    ];
  } else
    return SizedBox();

  return ShaderMask(
    shaderCallback: (rect) => ui.Gradient.linear(
      rect.topCenter,
      rect.bottomCenter,
      _colors,
    ),
    child: Text(
      _rank,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );
}
