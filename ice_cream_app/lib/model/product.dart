import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';

class Product {
  final String flavor, image;
  final Color color, textColor;
  final double price;
  final int stars, energy, calories, calcium, sugar;

  Product({
    @required this.flavor,
    @required this.color,
    @required this.textColor,
    @required this.price,
    @required this.image,
    @required this.stars,
    @required this.calcium,
    @required this.calories,
    @required this.energy,
    @required this.sugar,
  });
}

List<Product> products = [
  Product(
    flavor: "Strawberry",
    color: kLightChocolate,
    textColor: kChocolate,
    price: 5.89,
    image: "assets/images/strawberry-flavor.png",
    stars: 4,
    energy: 1048,
    calories: 110,
    calcium: 30,
    sugar: 0,
  ),
  Product(
    flavor: "Pistache",
    color: kLightPistache,
    textColor: kPistache,
    price: 6.5,
    image: "assets/images/pistache-flavor.png",
    stars: 5,
    energy: 1200,
    calories: 150,
    calcium: 20,
    sugar: 0,
  ),
];
