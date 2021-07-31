import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';

import 'widgets/header_with_search_box.dart';
import 'widgets/plant_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController
      ..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool _isPinned = _scrollOffset >= 140 ? true : false;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: CustomScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          // SliverToBoxAdapter(
          //   child: Container(height: 60, color: Colors.blue.withOpacity(.3)),
          // ),
          SliverStickyHeader(
            sticky: _isPinned,
            header: HeaderWithSearchBox(isPinned: _isPinned),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  PlantCategory(
                    key: PageStorageKey("Recommended"),
                    ratio: 2 / 3,
                    data: recommendedData,
                    label: "Recommended",
                  ),
                  PlantCategory(
                    key: PageStorageKey("Featured"),
                    ratio: 1,
                    data: featuredData,
                    label: "Featured",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
