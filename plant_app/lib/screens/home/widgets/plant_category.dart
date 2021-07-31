import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/details/details_screen.dart';

import 'category_header.dart';

class PlantCategory extends StatelessWidget {
  const PlantCategory({
    Key key,
    this.ratio,
    this.data,
    this.label,
  }) : super(key: key);

  final double ratio;
  final List<Plant> data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          CategoryHeader(
            action: "More",
            label: label,
            onPress: () {},
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: AspectRatio(
                    aspectRatio: this.ratio,
                    child: Card(
                      elevation: 30,
                      shadowColor: kPrimaryColor.withOpacity(.2),
                      color: Colors.white,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Hero(
                                  tag: this.data[index].label,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          this.data[index].asset,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      this.data[index].label.toUpperCase(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Text(
                                      '\$${this.data[index].price.toStringAsFixed(2)}',
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  this.data[index].origin.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: kPrimaryColor.withOpacity(.5)),
                                ),
                              ),
                            ],
                          ),
                          Material(
                            type: MaterialType.transparency,
                            child: InkWell(
                              splashColor: kPrimaryColor.withOpacity(.15),
                              highlightColor: Colors.white.withOpacity(.2),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => DetailsScreen(
                                      key: PageStorageKey("detail"),
                                      plant: this.data[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
