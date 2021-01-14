import 'package:flutter/material.dart';
import 'package:movie_app2/models/movie_model.dart';
import 'package:movie_app2/screens/home_screen/widgets/content_scroll.dart';
import 'package:movie_app2/widgets/circular_clipper.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({Key key, this.movie}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: this.widget.movie.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image.asset(
                      this.widget.movie.imageUrl,
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  Image.asset(
                    "assets/images/netflix_logo.png",
                    width: 150.0,
                    height: 60.0,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(right: 30.0),
                    onPressed: () => {},
                    icon: Icon(
                      Icons.favorite_outline,
                    ),
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: const EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () {},
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 20,
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {},
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 20,
                child: IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  this.widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  this.widget.movie.categories,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 12.0),
                Text("⭐ ⭐ ⭐ ⭐", style: TextStyle(fontSize: 25)),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          "Year",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          this.widget.movie.year.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Country",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          this.widget.movie.country.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Length",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "${this.widget.movie.length} min",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Container(
                  height: 140.0,
                  child: SingleChildScrollView(
                    child: Text(
                      this.widget.movie.description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: this.widget.movie.screenshots,
            title: "Screenshots",
            imageHeight: 200,
            imageWidth: 250,
          )
        ],
      ),
    );
  }
}
