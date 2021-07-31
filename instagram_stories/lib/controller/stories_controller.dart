import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../models/story_model.dart';
import '../models/user_model.dart';

/// Initialize an an array of users each with multiple stories.
/// Take the first user and iterate through each storie.
/// onTap should advance to next or previous story
/// onLongPress should pause the animation.

class StoriesController extends GetxController
    with SingleGetTickerProviderMixin {
  final List<User> userStories;

  StoriesController({this.userStories}) : super();

  AnimationController _animController;
  VideoPlayerController _videoController;
  PageController _pageController;

  AnimationController get animController => this._animController;
  VideoPlayerController get videoController => this._videoController;
  PageController get pageController => this._pageController;

  User get user => this.userStories[_userIndex];
  Story get story => this.userStories[_userIndex].stories[_bar.value];

  RxString get imageUrl =>
      this.userStories[_userIndex].stories[_bar.value].url.obs;

  Rx<MediaType> get media =>
      this.userStories[_userIndex].stories[_bar.value].media.obs;

  RxInt _bar = 0.obs;
  RxInt _bars = 0.obs;

  RxInt get bar => _bar;
  RxInt get bars => _bars;

  int _userIndex = 0;

  bool get _isNotLastStory => _bar + 1 < this.user.stories.length;

  bool get _isNotLastUser => _userIndex + 1 < this.userStories.length;

  showStories(int i) {
    _userIndex = i;

    var notWatched =
        this.userStories[i].stories.where((s) => s.watched).toList();

    _bars.value = this.user.stories.length;

    if (notWatched.length == 0)
      _bar.value = 0;
    else
      _bar.value = _bars.value - notWatched.length - 1;

    _loadStory();
  }

  @override
  void onInit() {
    super.onInit();

    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextVideo();
      }
    });
  }

  void onTapDown(TapDownDetails details, double screenWidth) {
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 3)
      _previousVideo();
    else if (dx > 2 * screenWidth / 3) _nextVideo();
  }

  bool get _isNotFirstStory => _bar.value - 1 >= 0;

  bool get _isNotFirstUser => _userIndex > 0;

  void _animateToPage() {
    _bars.value = this.user.stories.length;

    _pageController.animateToPage(
      _userIndex,
      duration: const Duration(milliseconds: 480),
      curve: Curves.easeInOut,
    );
  }

  void _previousVideo() {
    if (_isNotFirstStory) {
      _bar--;
      _loadStory();
    } else if (_isNotFirstUser) {
      _userIndex--;
      _bar.value = 0;
      _loadStory();
      _animateToPage();
    }
  }

  void _nextVideo() {
    if (_isNotLastStory) {
      _loadStory();
    } else if (_isNotLastUser) {
      _userIndex++;

      _bar.value = 0;

      _loadStory();

      _animateToPage();
    } else {
      Get.close(1);
    }
  }

  onLongPressStart(LongPressStartDetails startDetails) {
    _pause();
  }

  onLongPressEnd(LongPressEndDetails endDetails) {
    _resume();
  }

  void _resume() {
    if (this.story.media == MediaType.video) _videoController.play();
    _animController.forward();
  }

  void _pause() async {
    if (this.story.media == MediaType.video) await _videoController.pause();
    _animController.stop();
  }

  void _reset() {
    _animController.stop();
    _animController.reset();
  }

  void _loadStory() {
    _reset();

    switch (this.story.media) {
      case MediaType.image:
        _animController.duration = this.story.duration;
        _animController.forward();
        break;
      case MediaType.video:
        _videoController?.dispose();

        _videoController = VideoPlayerController.network(
            "https://static.videezy.com/system/resources/previews/000/005/529/original/Reaviling_Sjusj%C3%B8en_Ski_Senter.mp4")
          ..initialize().then((_) {
            if (_videoController.value.initialized) {
              _animController.duration = _videoController.value.duration;

              _resume();
            }
          });
        break;
    }
  }

  @override
  void onClose() {
    _animController.dispose();
    _pageController.dispose();
    _videoController.dispose();

    super.dispose();
  }
}
