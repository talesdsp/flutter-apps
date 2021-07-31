import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'story_model.dart';

class User {
  final String name;
  final String profileImageUrl;
  final List<Story> stories;

  const User({
    @required this.name,
    @required this.profileImageUrl,
    @required this.stories,
  });
}
