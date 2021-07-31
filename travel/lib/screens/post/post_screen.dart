import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:travel/models/post_model.dart';
import 'package:travel/widgets/circular_clipper.dart';
import 'package:travel/widgets/index.dart';

class PostScreen extends StatefulWidget {
  final Post post;

  const PostScreen({Key key, @required this.post}) : super(key: key);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool _fullscreen;
  bool _commenting = false;
  String _replyTo = "";

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    double _height = _size.width * .7;

    CustomAnimationControl _customAnimationControl = _fullscreen == null
        ? CustomAnimationControl.STOP
        : _fullscreen
            ? CustomAnimationControl.PLAY
            : CustomAnimationControl.PLAY_REVERSE_FROM_END;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.white),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() => _commenting = false);
        },
        child: SizedBox(
          height: _size.height * 2,
          child: Stack(
            children: [
              AnimatedPositioned(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 300),
                left: 20,
                right: 20,
                bottom: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Send a message ;)",
                          labelText:
                              _replyTo.isNotEmpty ? '@$_replyTo' : "Comment",
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      child: Icon(Icons.send_rounded),
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        setState(() {
                          _replyTo = "";
                          _commenting = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                curve: Curves.easeOut,
                duration: Duration(milliseconds: 300),
                top: _size.width * .7,
                left: 0,
                right: 0,
                bottom: _commenting ? 90 : 0,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      CommentItem(
                        isOp: true,
                        comment: this.widget.post,
                        onTap: () {
                          setState(() {
                            _commenting = true;
                            _replyTo = '';
                          });
                        },
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 20),
                          itemCount: this.widget.post.comments.length,
                          itemBuilder: (context, index) => CommentItem(
                            comment: this.widget.post.comments[index],
                            onTap: () {
                              setState(() {
                                _commenting = true;
                                _replyTo =
                                    this.widget.post.comments[index].name;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_fullscreen != null)
                      _fullscreen = !_fullscreen;
                    else
                      _fullscreen = true;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 480),
                  curve: Curves.easeInOutSine,
                  height: (_fullscreen != null && _fullscreen)
                      ? _size.height
                      : _height,
                  width: double.infinity,
                  child: Hero(
                    tag: this.widget.post.imageUrl + this.widget.post.name,
                    child: CustomAnimation<double>(
                      control: _customAnimationControl,
                      tween: Tween(begin: 20.0, end: 0.0),
                      curve: Curves.easeInOutSine,
                      duration: Duration(milliseconds: 600),
                      builder: (context, child, tween) => ClipShadowPath(
                        clipper: CircularClipper(height: tween),
                        shadow: Shadow(color: Colors.black38, blurRadius: 10),
                        child: child,
                      ),
                      child: Image.asset(
                        this.widget.post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentItem extends StatefulWidget {
  final dynamic comment;
  final Function onTap;
  final bool isOp;

  const CommentItem({Key key, this.comment, this.onTap, this.isOp = false})
      : super(key: key);

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool _expanded = false;

  void toggleExpandableText() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            bottom: widget.isOp ? 10 : 0,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 50,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: 15,
                  backgroundImage: AssetImage(this.widget.comment.imageUrl),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 0,
                      bottom: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          this.widget.comment.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: toggleExpandableText,
                          child: Text(
                            this.widget.comment.text,
                            overflow: _expanded ? null : TextOverflow.ellipsis,
                            maxLines: _expanded ? null : 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    icon: Icon(Icons.favorite_outline),
                    onPressed: () {},
                    tooltip: "Like",
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  shape: CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: IconButton(
                    onPressed: widget.onTap,
                    tooltip: "Reply",
                    icon: Icon(Icons.reply, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(height: 1),
      ],
    );
  }
}
