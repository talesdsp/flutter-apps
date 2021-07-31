import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/models/activity_model.dart';
import 'package:travel/models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({
    Key key,
    @required this.destination,
  }) : super(key: key);

  final Destination destination;

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  ScrollController _scrollController;
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _offset = _scrollController.offset;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    double _calcSize =
        _size.height / 2 * ((1 - (_offset * 0.0009)).clamp(0.2, 1.0));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Hero(
              tag: this.widget.destination.imageUrl,
              child: Container(
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(bottom: 20),
                height: _calcSize,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    )
                  ],
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage(this.widget.destination.imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.black12, BlendMode.darken),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      this.widget.destination.city,
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.locationArrow,
                              size: 14,
                              color: Colors.white70,
                            ),
                            SizedBox(width: 5),
                            Text(
                              this.widget.destination.country,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(color: Colors.white70),
                            ),
                          ],
                        ),
                        Icon(Icons.pin_drop, color: Colors.white70)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              this
                  .widget
                  .destination
                  .activities
                  .asMap()
                  .map(
                    (index, activity) => MapEntry(
                      index,
                      ActivityItem(activity: activity),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  const ActivityItem({
    @required this.activity,
  });

  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 20),
      child: AspectRatio(
        aspectRatio: 16 / 8,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: [
                                          TextSpan(
                                            text: this.activity.name + '\n',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          TextSpan(
                                            text: this.activity.type,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: Colors.black26),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '\$${this.activity.price}\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text: 'per day',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .copyWith(color: Colors.black26),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              _genStars(this.activity.rating),
                              SizedBox(height: 15),
                              SizedBox(
                                height: 30,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: this.activity.startTimes.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        primary: Theme.of(context).accentColor,
                                        elevation: 0,
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text(
                                        this.activity.startTimes[index],
                                        style: TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            _buildActivityImage(activity),
          ],
        ),
      ),
    );
  }
}

Widget _buildActivityImage(Activity activity) {
  return Padding(
    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 10),
    child: AspectRatio(
      aspectRatio: .75,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Image.asset(
          activity.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Widget _genStars(int rating) {
  String stars = '';
  for (int i = 0; i < rating; i++) {
    stars += '⭐';
  }

  return Text(stars);
}
