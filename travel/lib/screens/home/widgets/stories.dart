import 'dart:io';
import "dart:ui" as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel/models/story_model.dart';
import 'package:travel/widgets/select_media_type_dialog.dart';

class Stories extends StatelessWidget {
  final List<Story> stories;
  const Stories({Key key, @required this.stories}) : super(key: key);

  void _uploadStory(String filePath) async {
    Image image;
    if (kIsWeb) {
      image = Image.network(filePath);
    } else {
      image = Image.file(File(filePath));
    }
  }

  void _addNewStory(BuildContext context) async {
    PickedFile pickedFile = await selectMediaTypeDialog(context);

    if (pickedFile != null) {
      _uploadStory(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 10,
            offset: Offset(0, 12),
          ),
        ],
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).accentColor,
            width: 3,
          ),
        ),
      ),
      height: 93,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: stories.length + 1,
        itemBuilder: (context, index) => index == 0
            ? GestureDetector(
                onTap: () => _addNewStory(context),
                child: Container(
                  width: 70,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[400],
                  ),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )
            : StoriesItem(
                story: this.stories[index - 1],
              ),
      ),
    );
  }
}

class StoriesItem extends StatelessWidget {
  final Story story;

  const StoriesItem({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: CustomPaint(
        painter: BorderPainter(),
        child: CircleAvatar(
          maxRadius: 35,
          backgroundImage: AssetImage(
            this.story.imageUrl,
          ),
        ),
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var center = Offset(35, 35);

    canvas.drawCircle(
      center,
      35,
      Paint()
        ..shader = ui.Gradient.linear(
          Offset(0, 0),
          Offset(70, 70),
          [Colors.blue, Colors.purple, Colors.red],
          [.33, .66, 1],
        )
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
