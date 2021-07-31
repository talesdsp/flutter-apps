import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/details/details_screen.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key key}) : super(key: key);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  bool _grid;

  @override
  void initState() {
    super.initState();

    _grid = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: IconButton(
        icon: Icon(!_grid ? Icons.grid_off : Icons.grid_on),
        color: _grid ? Colors.blue : Colors.grey,
        onPressed: () {
          setState(() {
            _grid = !_grid;
          });
        },
      ),
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          _grid
              ? GridView.builder(
                  itemCount: favouriteData.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Gem(
                    data: favouriteData[index],
                  ),
                )
              : ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 90),
                  scrollDirection: Axis.vertical,
                  itemCount: favouriteData.length,
                  itemBuilder: (context, index) => Gem(
                    data: favouriteData[index],
                  ),
                ),
        ],
      ),
    );
  }
}

class Gem extends StatelessWidget {
  const Gem({Key key, this.data}) : super(key: key);

  final Plant data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Card(
          elevation: 20,
          shadowColor: kPrimaryColor.withOpacity(.2),
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: this.data.label,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              this.data.asset,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          this.data.label.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          '\$${this.data.price.toStringAsFixed(2)}',
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
                      this.data.origin.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: kPrimaryColor.withOpacity(.5)),
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
                          plant: this.data,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
