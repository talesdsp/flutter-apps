import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum StoryMedia { video, image }

Future<PickedFile> selectMediaTypeDialog(BuildContext context) async {
  final imagePicker = ImagePicker();

  switch (await showDialog<StoryMedia>(
    context: context,
    builder: (BuildContext context) => _dialog(context),
  )) {
    case StoryMedia.image:
      return await imagePicker.getImage(
        source: ImageSource.camera,
      );

      break;
    case StoryMedia.video:
      return await imagePicker.getVideo(
        source: ImageSource.gallery,
      );
      break;
    default:
      return null;
  }
}

Widget _dialog(BuildContext context) {
  void _selectImage() => Navigator.pop(context, StoryMedia.image);

  void _selectVideo() => Navigator.pop(context, StoryMedia.video);

  return SimpleDialog(
    title: const Text('Select media type'),
    children: <Widget>[
      SimpleDialogOption(
        onPressed: _selectImage,
        child: Row(
          children: [
            const Icon(Icons.image),
            const SizedBox(width: 5),
            const Text('Add Image'),
          ],
        ),
      ),
      SimpleDialogOption(
        onPressed: _selectVideo,
        child: Row(
          children: [
            const Icon(Icons.video_call),
            const SizedBox(width: 5),
            const Text('Add Video'),
          ],
        ),
      ),
    ],
  );
}
