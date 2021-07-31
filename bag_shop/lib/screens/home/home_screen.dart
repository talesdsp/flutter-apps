import 'package:bag_shop/constants.dart';
import 'package:bag_shop/models/product.dart';
import 'package:bag_shop/screens/details/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'widgets/dot_notification_painter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController _tabController;

  List<String> _tabs = const [
    "Hand bag",
    "Jewellery",
    "Footwear",
    "Dress",
    "Rouge",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          padding: const EdgeInsets.only(left: 5),
          icon: WebsafeSvg.asset('assets/icons/back.svg'),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/icons/search.svg",
              color: kTextColor,
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
                  color: kTextColor,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Women",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: _tabs.map((e) => Tab(text: e)).toList(),
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 10, bottom: kDefaultPadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: products[index],
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: .85,
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: products[index].color,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Hero(
                          tag: products[index].image,
                          child: Image.asset(
                            products[index].image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      products[index].title,
                      style: TextStyle(color: kTextLightColor),
                      strutStyle: StrutStyle(height: 1.2),
                    ),
                    Text(
                      '\$${products[index].price.toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
