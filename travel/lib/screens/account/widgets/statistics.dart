import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color(0xFFF3F5F7),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "🚀Stats",
            style: Theme.of(context).textTheme.headline4.copyWith(
                color: Colors.black87,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Stat(
            label: "Check-ins",
            progress: 1,
            outOf: 5,
            score: '1 / 5',
            level: 1,
          ),
          Stat(
            label: "Mileage",
            progress: 56,
            outOf: 100,
            score: '56km / 100km',
            level: 1,
          ),
          Stat(
            label: "The 7 World Wonders",
            progress: 0,
            outOf: 7,
            score: '0 / 1',
            level: 0,
          ),
          SizedBox(height: 20),
          Text(
            "Rank #92340",
            style: TextStyle(color: Colors.black26),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class Stat extends StatelessWidget {
  final String label;
  final String score;
  final double progress;
  final double outOf;
  final int level;

  const Stat(
      {Key key, this.label, this.score, this.progress, this.outOf, this.level})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.label,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.purple[900]),
              ),
              Text(
                this.score,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.purple[900]),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            width: double.infinity,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFF3F5F7),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 1,
                )
              ],
            ),
            child: Stack(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * (this.progress / this.outOf),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.greenAccent[100],
                      gradient: LinearGradient(
                        tileMode: TileMode.mirror,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.purple[900],
                          Colors.green[400],
                          Colors.greenAccent[400],
                        ],
                        stops: [0, 0.4, 1],
                      ),
                      backgroundBlendMode: BlendMode.srcOver,
                    ),
                    child: PlasmaRenderer(
                      type: PlasmaType.infinity,
                      particles: 10,
                      color: Color(0x33D8ECF1),
                      blur: 0.45,
                      size: 0.93,
                      speed: 2.89,
                      offset: 0,
                      blendMode: BlendMode.plus,
                      variation1: 0,
                      variation2: 0,
                      variation3: 0,
                      rotation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '⭐' * this.level,
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
