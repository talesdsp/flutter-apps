import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minimalist_clock/size_config.dart';

import 'widgets/clock.dart';
import 'widgets/time_in_hour_and_minutes.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: appBar(context),
      body: body(context),
    );
  }
}

appBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      alignment: Alignment.center,
      icon: SvgPicture.asset(
        "assets/icons/Settings.svg",
        color: Theme.of(context).iconTheme.color,
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Material(
          shape: CircleBorder(),
          child: InkWell(
            onTap: () {},
            child: Ink(
              width: getProportionateScreenWidth(32),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      )
    ],
  );
}

body(BuildContext context) {
  return SafeArea(
    child: SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'Sao Paulo',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          TimeInHourAndMinutes(),
          Spacer(),
          Clock(),
          Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryCard(
                  country: "New York",
                  iconSrc: 'assets/icons/Liberty.svg',
                  period: 'pm',
                  time: '9:20',
                  timeZone: '+3 HRS | EST',
                ),
                CountryCard(
                  country: "Sidney, AU",
                  iconSrc: 'assets/icons/Sydney.svg',
                  period: 'pm',
                  time: '1:20',
                  timeZone: '+19 HRS | AEST',
                ),
                CountryCard(
                  country: "Sao Paulo",
                  iconSrc: 'assets/icons/Liberty.svg',
                  period: 'pm',
                  time: '1:20',
                  timeZone: '-3 HRS | EST',
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    ),
  );
}

class CountryCard extends StatelessWidget {
  final String country, timeZone, iconSrc, time, period;

  const CountryCard({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.iconSrc,
    @required this.time,
    @required this.period,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.country,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: getProportionateScreenWidth(16),
                      ),
                ),
                SizedBox(height: 5),
                Text(this.timeZone),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      this.iconSrc,
                      width: getProportionateScreenWidth(40),
                    ),
                    Spacer(),
                    Text(
                      this.time,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(this.period),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
