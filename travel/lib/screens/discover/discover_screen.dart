import 'package:flutter/material.dart';
import 'package:travel/models/destination_model.dart';
import 'package:travel/models/hotel_model.dart';

import 'widgets/destination_list.dart';
import 'widgets/hotel_list.dart';
import 'widgets/preference_buttons.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 50,
              top: 50,
              bottom: 10,
            ),
            child: Text(
              "What would you like to find?",
              style: Theme.of(context).textTheme.headline4.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 30),
            ),
          ),
          PreferenceButtons(),
          DestinationList(destinations: destinations),
          SizedBox(height: 5),
          HotelList(hotels: hotels),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
