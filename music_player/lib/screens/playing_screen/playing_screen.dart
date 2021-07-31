import 'package:flutter/material.dart';
import 'package:music_player/constants.dart';
import "package:music_player/extensions/neumorphism.dart";

class PlayingScreen extends StatefulWidget {
  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .7, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    Widget _button({
      Function fn,
      Icon icon,
      double left = 0,
      double right = 0,
      double radius = 10,
    }) {
      return Padding(
        padding: EdgeInsets.only(left: left, right: right),
        child: Material(
          borderRadius: BorderRadius.circular(radius),
          clipBehavior: Clip.hardEdge,
          color: kBackgroundColor,
          child: Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: Border.all(
                  color: kPrimaryColor,
                )),
            child: IconButton(
              icon: icon,
              color: kPrimaryColor,
              onPressed: fn,
            ),
          ),
        ).addNeumorphism(borderRadius: radius),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: 90,
        toolbarHeight: kToolbarHeight * 2,
        leading: _button(
          left: 20,
          icon: const Icon(Icons.arrow_back_ios_outlined),
          fn: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Playing now'),
        actions: [
          _button(
            right: 20,
            fn: () {},
            icon: const Icon(Icons.list),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Music Name",
            ),
            Expanded(
              child: Center(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: 6,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Center(
                    child: Container(
                        // margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 180,
                          height: 180,
                          child: Text(''),
                        )).addNeumorphism(),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        color: Colors.grey,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 4,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: LayoutBuilder(
                          builder: (context, constraints) => Container(
                            width: constraints.maxWidth * .5,
                            height: 4,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _button(
                        fn: () {},
                        icon: const Icon(Icons.play_arrow),
                        radius: 50,
                      ),
                      _button(
                        fn: () {},
                        icon: const Icon(Icons.play_arrow),
                        radius: 50,
                      ),
                      _button(
                        fn: () {},
                        icon: const Icon(Icons.play_arrow),
                        radius: 50,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
