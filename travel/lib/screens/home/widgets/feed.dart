import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import "package:share/share.dart";
import 'package:travel/models/post_model.dart';
import 'package:travel/screens/post/post_screen.dart';

class Feed extends StatelessWidget {
  final List<Post> posts;

  const Feed({
    @required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => FeedItem(
          post: this.posts[index],
        ),
        childCount: this.posts.length,
      ),
    );
  }
}

class FeedItem extends StatefulWidget {
  final Post post;

  const FeedItem({
    @required this.post,
  });

  @override
  _FeedItemState createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool _liked = false;
  bool _reposted = false;

  double _likeOpacity = 0.0;
  int _likeOpacityMs = 480;

  double _panIndicatorOpacity = 0;
  int _panIndicatorDebounceMs = 100;
  int _panVariation = 30;

  double _dx1 = 0.0;

  double _dx2 = 0.0;
  double _dy2 = 0.0;

  bool _isPanL = false;
  bool _isPanR = false;

  void like() {
    setState(() {
      _liked = !_liked;
    });
  }

  void _repost() {
    setState(() {
      _reposted = !_reposted;
    });
  }

  void _share(BuildContext context) async {
    final RenderBox box = context.findRenderObject();

    // var docs = await DocumentsPicker.pickDocuments;

    Directory directory;

    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    await Share.shareFiles(
      ['${directory.path}/${widget.post.imageUrl}'],
      text: "Olha essa foto do travel :3",
      subject: "Olha essa foto do travel :3",
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _dx1 = details.localPosition.dx;
      _panIndicatorOpacity = 1;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dx2 = details.localPosition.dx;
      _dy2 = details.localPosition.dy;
    });
  }

  void _onPanEnd(DragEndDetails details, BuildContext context) {
    if (_isPanL) {
      _repost();
    } else if (_isPanR) {
      _share(context);
    }
    setState(() {
      _panIndicatorOpacity = 0;
    });
  }

  void _onDoubleTap() {
    setState(() {
      _liked = !_liked;
      if (_liked) _likeOpacity = .7;
    });

    Future.delayed(
      Duration(milliseconds: _likeOpacityMs),
      () => setState(() => _likeOpacity = 0),
    );
  }

  void _onTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostScreen(post: this.widget.post),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _isPanL = _dx2 < _dx1 - _panVariation;
    _isPanR = _dx2 > _dx1 + _panVariation;

    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      decoration: BoxDecoration(
        color: Color(0xFFF3F5F7),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 10.0, bottom: 15),
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 20,
                  backgroundImage: AssetImage(this.widget.post.imageUrl),
                ),
                SizedBox(width: 5),
                Text(
                  this.widget.post.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(this.widget.post.text),
          ),
          GestureDetector(
            onPanStart: _onPanStart,
            onPanUpdate: _onPanUpdate,
            onPanEnd: (a) => _onPanEnd(a, context),
            onDoubleTap: _onDoubleTap,
            onTap: _onTap,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Hero(
                    tag: this.widget.post.imageUrl + this.widget.post.name,
                    child: Image.asset(
                      this.widget.post.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _likeOpacity,
                    curve: Curves.decelerate,
                    duration: Duration(milliseconds: _likeOpacityMs),
                    child: Container(
                      color: Colors.black54,
                      child: Icon(
                        Icons.favorite_outlined,
                        color: Colors.white,
                        size: 90,
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: AnimatedOpacity(
                    opacity: _panIndicatorOpacity,
                    duration: Duration(milliseconds: _panIndicatorDebounceMs),
                    child: Container(
                      color: Colors.black54,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _panningButton(
                            active: _isPanL,
                            icon: Icons.repeat_outlined,
                          ),
                          SizedBox(width: _panVariation.toDouble()),
                          _panningButton(
                            active: _isPanR,
                            icon: Icons.share,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.linear,
                  duration: Duration(milliseconds: _panIndicatorDebounceMs),
                  left: _dx2 - _panVariation,
                  top: _dy2 - _panVariation,
                  child: AnimatedOpacity(
                    opacity: _panIndicatorOpacity,
                    duration: Duration(milliseconds: _panIndicatorDebounceMs),
                    child: Container(
                      height: 50,
                      width: 50,
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [Colors.white38, Colors.white10],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: IconButton(
                  icon: _liked
                      ? Icon(Icons.favorite_outlined, color: Colors.pink)
                      : Icon(Icons.favorite_outline),
                  onPressed: like,
                ),
              ),
              Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: IconButton(
                  icon: Icon(Icons.repeat_outlined,
                      color: _reposted ? Colors.green : null),
                  onPressed: _repost,
                ),
              ),
              Material(
                color: Colors.transparent,
                clipBehavior: Clip.hardEdge,
                shape: CircleBorder(),
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () => _share(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget _panningButton({bool active, IconData icon}) {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      boxShadow: !active
          ? null
          : [
              BoxShadow(
                color: Colors.white70,
                blurRadius: 80,
              )
            ],
    ),
    child: Icon(
      icon,
      size: 80,
      color: active ? Colors.white30 : Colors.transparent,
    ),
  );
}
