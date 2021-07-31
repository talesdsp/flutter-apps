import 'package:flutter/material.dart';
import 'package:travel/models/post_model.dart';
import 'package:travel/models/story_model.dart';
import 'package:travel/screens/home/widgets/feed.dart';
import 'package:travel/screens/home/widgets/stories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey[100],
            floating: true,
            title: Text("Travel app"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.message,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Stories(
                stories: stories,
                key: PageStorageKey("storiesKey"),
              ),
            ),
          ),
          Feed(posts: posts),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 70),
          )
        ],
      ),
    );
  }
}
