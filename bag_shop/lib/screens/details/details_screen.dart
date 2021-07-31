import 'package:bag_shop/models/product.dart';
import 'package:bag_shop/screens/details/widgets/color_selector.dart';
import 'package:bag_shop/screens/home/widgets/dot_notification_painter.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, @required this.product}) : super(key: key);

  final Product product;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: this.widget.product.color,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 5),
          icon: WebsafeSvg.asset('assets/icons/back.svg', color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/icons/search.svg",
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CustomPaint(
              painter: DotNotificationPainter(),
              child: IconButton(
                icon: WebsafeSvg.asset(
                  "assets/icons/cart.svg",
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              this.widget.product.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              this.widget.product.title,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: _size.height / 1.8,
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        SizedBox(
                          height: 70,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Color",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    ColorSelector(
                                      colors: [
                                        this.widget.product.color,
                                        Colors.orange,
                                        Colors.grey
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Size",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      "12cm",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 100,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              this.widget.product.description,
                              style: TextStyle(),
                              strutStyle: StrutStyle(height: 1.6),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ElevatedButton(
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.grey[600],
                                  ),
                                  onPressed: () {
                                    if (_counter > 0) {
                                      setState(() {
                                        _counter--;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.grey),
                                    ),
                                    minimumSize: Size.zero,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    _counter.toString(),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                ElevatedButton(
                                  child:
                                      Icon(Icons.add, color: Colors.grey[600]),
                                  onPressed: () {
                                    if (_counter < 10) {
                                      setState(() {
                                        _counter++;
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.grey),
                                    ),
                                    minimumSize: Size.zero,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(8),
                                primary: Colors.pink[200],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                minimumSize: Size.zero,
                              ),
                              child: Icon(
                                Icons.favorite_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                        SizedBox(height: 90)
                      ],
                    ),
                  ),
                ),

                /// product pic
                Positioned(
                  bottom: _size.height / 2.2,
                  left: 25,
                  right: 15,
                  child: SizedBox(
                    height: _size.height / 3,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Price",
                                style: TextStyle(color: Colors.white),
                                strutStyle: StrutStyle(
                                  height: 1.4,
                                ),
                              ),
                              Text(
                                "\$${this.widget.product.price.toString()}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Hero(
                            tag: this.widget.product.image,
                            child: Image.asset(
                              this.widget.product.image,
                              width: _size.width - 142,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// buttons
                Positioned(
                  left: 25,
                  right: 25,
                  bottom: 25,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: this.widget.product.color),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 14,
                          ),
                          primary: Colors.white,
                          minimumSize: Size.zero,
                        ),
                        child: WebsafeSvg.asset(
                          'assets/icons/add_to_cart.svg',
                          color: this.widget.product.color,
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Buy now".toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 13),
                            primary: this.widget.product.color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: Size.zero,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
