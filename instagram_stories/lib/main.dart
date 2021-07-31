import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:instagram_stories/controller/stories_controller.dart';
import 'package:instagram_stories/models/story_model.dart';
import 'package:instagram_stories/models/user_model.dart';
import 'package:video_player/video_player.dart';

import 'data.dart';
import 'models/story_model.dart';

void main() {
  runApp(MyApp());
}

class StoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoriesController>(
      () => StoriesController(userStories: userStories),
      fenix: true,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'Flutter Instagram Stories',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: "/",
          page: () => Home(),
        ), // here!
        GetPage(
          name: "/stories",
          page: () => StoryScreen(),
          binding: StoryBinding(),
        ), // here!
      ],
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/stories');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class StoryScreen extends StatelessWidget {
  final int userIndex;
  StoryScreen({
    this.userIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final StoriesController _storiesController = Get.find()
      ..showStories(userIndex);

    return GetX<StoriesController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onLongPressStart: _storiesController.onLongPressStart,
          onLongPressEnd: _storiesController.onLongPressEnd,
          onTapDown: (details) =>
              _storiesController.onTapDown(details, Get.width),
          child: Stack(
            children: <Widget>[
              PageView.builder(
                  controller: _storiesController.pageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _storiesController.userStories.length,
                  itemBuilder: (context, _i) {
                    return Obx(() {
                      switch (_storiesController.media.value) {
                        case MediaType.image:
                          return CachedNetworkImage(
                            imageUrl: _storiesController.imageUrl.value,
                            fit: BoxFit.cover,
                          );
                        case MediaType.video:
                          double width = _storiesController
                                  .videoController.value.initialized
                              ? _storiesController
                                  .videoController.value.size.width
                              : 20;
                          double height = _storiesController
                                  .videoController.value.initialized
                              ? _storiesController
                                  .videoController.value.size.height
                              : 20;

                          return FittedBox(
                            fit: BoxFit.contain,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: height,
                                maxWidth: width,
                              ),
                              child: VideoPlayer(
                                _storiesController.videoController,
                              ),
                            ),
                          );
                      }

                      return Container(
                        color: Colors.red,
                      );
                    });
                  }),
              Positioned(
                top: 40.0,
                left: 10.0,
                right: 10.0,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: List.generate(
                        _storiesController.bars.value,
                        (i) => AnimatedBar(position: i),
                      ).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1.5,
                        vertical: 10.0,
                      ),
                      child: UserInfo(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  final int position;

  AnimatedBar({
    Key key,
    @required this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                Obx(
                  () => _buildContainer(
                    double.infinity,
                    position < Get.find<StoriesController>().bar.value
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                  ),
                ),
                Obx(
                  () => position == Get.find<StoriesController>().bar.value
                      ? AnimatedBuilder(
                          animation:
                              Get.find<StoriesController>().animController,
                          builder: (context, child) {
                            return _buildContainer(
                              constraints.maxWidth *
                                  Get.find<StoriesController>()
                                      .animController
                                      .value,
                              Colors.white,
                            );
                          },
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: Colors.black26,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = Get.find<StoriesController>().user;

    return Row(
      children: <Widget>[
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[300],
          backgroundImage: CachedNetworkImageProvider(
            user.profileImageUrl,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            user.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () => Get.close(1),
        ),
      ],
    );
  }
}
