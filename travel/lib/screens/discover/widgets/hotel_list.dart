import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel/models/hotel_model.dart';
import 'package:travel/screens/hotel/hotel_screen.dart';

import 'category_list.dart';

class HotelList extends StatelessWidget {
  const HotelList({@required this.hotels});

  final List<Hotel> hotels;

  @override
  Widget build(BuildContext context) {
    return CategoryList(
      height: 310,
      items: this.hotels,
      cta: "See all",
      label: "Exclusive Hotels",
      onPressed: () {},
      builder: (context, index) => HotelItem(
        hotel: this.hotels[index],
      ),
    );
  }
}

class HotelItem extends StatelessWidget {
  const HotelItem({this.hotel});

  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (b) => HotelScreen(hotel: this.hotel),
              ),
            );
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                _buildTopImage(context, hotel),
                _buildBottomDescription(context, hotel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildBottomDescription(BuildContext context, Hotel hotel) {
  return Positioned(
    left: 20,
    right: 20,
    bottom: 70,
    child: Container(
      clipBehavior: Clip.hardEdge,
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          radius: 2,
          colors: [
            Colors.white,
            Colors.white54,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            hotel.name,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          SizedBox(height: 5),
          Text(
            '\$${hotel.price} / night',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTopImage(BuildContext context, Hotel hotel) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: AspectRatio(
      aspectRatio: 16 / 9,
      child: Hero(
        tag: hotel.imageUrl,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(hotel.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              const BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(15),
        ),
      ),
    ),
  );
}
