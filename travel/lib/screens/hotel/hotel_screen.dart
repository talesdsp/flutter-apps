import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel/models/hotel_model.dart';
import 'package:travel/widgets/index.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({
    Key key,
    @required this.hotel,
  }) : super(key: key);

  final Hotel hotel;

  @override
  _HotelScreenState createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  ScrollController _scrollController;
  double _offset = 0.0;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _offset = _scrollController.offset;
        });
      });

    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.animateTo(
        300,
        curve: Curves.easeOutSine,
        duration: Duration(milliseconds: 600),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _calcClipperHeight = 60 * (_offset * 0.003).clamp(0.0, 1.0);

    double _appBarOpacity = 1 * (_offset * 0.004).clamp(0.0, 1.0);

    double _calcSize =
        _size.height * ((1 - (_offset * 0.0009)).clamp(0.2, 1.0));

    bool _hasVacancies = this.widget.hotel.vacancies > 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(_appBarOpacity),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.share,
            ),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ClipShadowPath(
              clipper: CircularClipper(height: _calcClipperHeight),
              shadow: Shadow(blurRadius: 20.0, color: Colors.black26),
              child: Stack(
                children: [
                  Hero(
                    tag: widget.hotel.imageUrl,
                    child: Image.asset(
                      this.widget.hotel.imageUrl,
                      height: _calcSize,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    this.widget.hotel.name,
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.pin_drop, color: Colors.black45),
                      Text(
                        this.widget.hotel.address,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: Colors.black54),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    this.widget.hotel.description,
                    strutStyle: StrutStyle(
                      height: 1.5,
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black87),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(this.widget.hotel.imageUrl),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                          ),
                          onPressed: _hasVacancies ? () {} : null,
                          child: Text(
                            _hasVacancies ? 'Book' : "Sold Off",
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
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
