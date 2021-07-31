import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/models/destination_model.dart';
import 'package:travel/screens/destination/destination_screen.dart';

import 'category_list.dart';

class DestinationList extends StatelessWidget {
  const DestinationList({this.destinations});

  final List<Destination> destinations;

  @override
  Widget build(BuildContext context) {
    return CategoryList(
      onPressed: () {},
      label: "Top Destinations",
      cta: "See all",
      height: 350,
      items: destinations,
      builder: (context, index) => DestinationItem(
        destination: this.destinations[index],
      ),
    );
  }
}

class DestinationItem extends StatelessWidget {
  const DestinationItem({this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (b) => DestinationScreen(destination: this.destination),
            ),
          );
        },
        child: AspectRatio(
          aspectRatio: .8,
          child: Stack(
            children: [
              _buildBottomDescription(context, destination),
              _buildTopImage(context, destination),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBottomDescription(BuildContext context, Destination destination) {
  return Positioned(
    left: 0,
    right: 0,
    bottom: 5,
    child: Container(
      height: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '${destination.activities.length} activities',
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            destination.description,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.black26),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTopImage(BuildContext context, Destination destination) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: AspectRatio(
      aspectRatio: 1,
      child: Hero(
        tag: destination.imageUrl,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(destination.imageUrl),
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.black12, BlendMode.darken),
            ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              const BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                destination.city,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.1),
              ),
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.locationArrow,
                    size: 14,
                    color: Colors.white70,
                  ),
                  SizedBox(width: 5),
                  Text(
                    destination.country,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white54),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
