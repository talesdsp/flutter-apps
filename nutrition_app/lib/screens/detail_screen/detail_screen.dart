import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nutrition_app/common/constants.dart';
import 'package:nutrition_app/models/food.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailScreen extends StatefulWidget {
  final Food food;

  DetailScreen({
    Key key,
    this.food,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  SheetController _sheetController;
  List<String> _textSplit;
  int _counter;
  String _selected;

  int _r1, _r2, _r3, _r4;

  @override
  void initState() {
    super.initState();
    _sheetController = SheetController();
    _counter = 1;

    _textSplit = this.widget.food.title.split(" ");

    _r1 = Random().nextInt(300);
    _r2 = Random().nextInt(300);
    _r3 = Random().nextInt(300);
    _r4 = Random().nextInt(10);

    Timer(
        Duration(
          milliseconds: 100,
        ), () {
      _sheetController.scrollTo(
        0,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 1200),
      );
    });
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper)
      return 1.0;
    else if (progress < lower) return 0.0;

    return ((progress - lower) / upper - lower).clamp(0.0, 1.0);
  }

  void _increment() {
    setState(() {
      _counter += 1;
    });
  }

  void _decrement() {
    if (_counter > 0) {
      setState(() {
        _counter -= 1;
      });
    }
  }

  void _select(String str) {
    setState(() {
      _selected = str;
    });
  }

  double paddingTop;
  @override
  Widget build(BuildContext context) {
    paddingTop = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: kLavender,
      body: Stack(
        children: <Widget>[
          _appBar(context),
          SlidingSheet(
            controller: _sheetController,
            cornerRadius: 55,
            scrollSpec: ScrollSpec(
              physics: NeverScrollableScrollPhysics(),
            ),
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [.6, .78],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                padding: const EdgeInsets.only(
                  top: 220,
                ),
                color: Colors.white,
                height: (MediaQuery.of(context).size.height) -
                    (MediaQuery.of(context).size.height / 10 + paddingTop),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            TextSpan(
                              text: _textSplit[0],
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: ' ' + _textSplit[1],
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    IntrinsicHeight(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$' + this.widget.food.price.toString(),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                              ),
                            ),
                            VerticalDivider(
                              color: Colors.grey[300],
                              thickness: 2,
                            ),
                            Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                color: kLavender,
                                borderRadius: BorderRadius.circular(020),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    onTap: _decrement,
                                  ),
                                  Text(
                                    _counter.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    child: InkWell(
                                      child: Icon(
                                        Icons.add,
                                        color: kLavender,
                                        size: 22,
                                      ),
                                      onTap: _increment,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          listItem(
                            context: context,
                            title: 'weight',
                            number: _r1,
                            suffix: 'g',
                            select: _select,
                            selected: _selected,
                          ),
                          listItem(
                            context: context,
                            title: 'calories',
                            number: _r2,
                            suffix: 'cal',
                            select: _select,
                            selected: _selected,
                          ),
                          listItem(
                            context: context,
                            title: 'vitamin A',
                            number: _r3,
                            suffix: 'vit',
                            select: _select,
                            selected: _selected,
                          ),
                          listItem(
                            context: context,
                            title: 'sugar',
                            number: _r4,
                            suffix: 'g',
                            select: _select,
                            selected: _selected,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: RawMaterialButton(
                        fillColor: kPurple,
                        constraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width - 60,
                          minHeight: 100,
                          // maxHeight: 100,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {},
                        child: Text(
                          '\$' + (this.widget.food.price * _counter).toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          AnimatedPadding(
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.only(
              top: (MediaQuery.of(context).size.height / 10 + paddingTop),
            ),
            child: LoopAnimation(
              curve: Curves.linear,
              tween: Tween(begin: 0.0, end: 360.0),
              duration: Duration(seconds: 3000),
              builder: (context, widget, value) {
                return Transform.rotate(
                  angle: value,
                  child: widget,
                );
              },
              child: Hero(
                tag: this.widget.food.image,
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        this.widget.food.image,
                      ),
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
    ),
    title: Align(
      alignment: Alignment.center,
      child: Text(
        "Details",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.more_horiz),
        onPressed: () {},
      ),
    ],
  );
}

Widget listItem(
    {String title,
    int number,
    String suffix,
    String selected,
    Function select,
    context}) {
  _selected() {
    return selected == title;
  }

  return GestureDetector(
    onTap: () {
      select(title);
    },
    child: Container(
      decoration: BoxDecoration(
        color: _selected() ? kLavender : null,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]),
      ),
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: _selected() ? Colors.white : Colors.black54,
            ),
          ),
          RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: number.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: _selected() ? Colors.white : Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: '\n' + suffix.toUpperCase(),
                    style: TextStyle(
                      color: _selected() ? Colors.white : Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ]),
          )
        ],
      ),
    ),
  );
}
