import 'package:flutter/material.dart';
import 'package:ice_cream_app/constants.dart';

class Product {
  final String flavor, image;
  final Color primary, secondary;
  final double price;
  final int stars, energy, calories, calcium, sugar;

  Product({
    @required this.flavor,
    @required this.primary,
    @required this.secondary,
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
    primary: kHotPink,
    secondary: kLightPink,
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
    primary: kPistache,
    secondary: kLightPistache,
    price: 6.5,
    image: "assets/images/pistache-flavor.png",
    stars: 5,
    energy: 1200,
    calories: 150,
    calcium: 20,
    sugar: 0,
  ),
  Product(
    flavor: "Chocolate",
    primary: kChocolate,
    secondary: kLightChocolate,
    price: 7.23,
    image: "assets/images/pistache-flavor.png",
    stars: 5,
    energy: 1400,
    calories: 170,
    calcium: 23,
    sugar: 5,
  ),
  Product(
    flavor: "Vanilla",
    primary: kVanilla,
    secondary: kLightVanilla,
    price: 4.69,
    image: "assets/images/pistache-flavor.png",
    stars: 5,
    energy: 1400,
    calories: 170,
    calcium: 23,
    sugar: 5,
  ),
  Product(
    flavor: "Acai",
    primary: kAcai,
    secondary: kLightAcai,
    price: 9.00,
    image: "assets/images/pistache-flavor.png",
    stars: 3,
    energy: 1400,
    calories: 170,
    calcium: 23,
    sugar: 5,
  ),
  Product(
    flavor: "Chocolate Chips",
    primary: kChocolateChip,
    secondary: kLightChocolateChip,
    price: 5.25,
    image: "assets/images/pistache-flavor.png",
    stars: 4,
    energy: 1400,
    calories: 170,
    calcium: 23,
    sugar: 5,
  ),
];
