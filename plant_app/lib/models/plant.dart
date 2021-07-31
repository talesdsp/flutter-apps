import 'package:flutter/material.dart';

class Plant {
  const Plant({
    @required this.label,
    @required this.asset,
    @required this.price,
    @required this.origin,
    @required this.description,
  });

  final String label, asset, origin, description;
  final double price;
}

List<Plant> recommendedData = [
  Plant(
    label: 'Samantha',
    asset: "assets/images/image_1.png",
    origin: "Russia",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    price: 234,
  ),
  Plant(
    label: 'Angelica',
    origin: "Brazil",
    asset: "assets/images/image_2.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Et malesuada fames ac turpis egestas sed tempus urna. Tortor condimentum lacinia quis vel eros donec ac. Elementum nibh tellus molestie nunc non blandit massa enim. Amet risus nullam eget felis. Eget felis eget nunc lobortis. Ut diam quam nulla porttitor massa id. Id velit ut tortor pretium viverra suspendisse potenti. Eu augue ut lectus arcu bibendum at varius vel pharetra.Blandit aliquam etiam erat velit scelerisque in. Volutpat diam ut venenatis tellus in metus vulputate eu scelerisque. Vel orci porta non pulvinar. In vitae turpis massa sed elementum. Risus in hendrerit gravida rutrum quisque non tellus orci ac. Ut aliquam purus sit amet luctus venenatis. Curabitur gravida arcu ac tortor dignissim convallis aenean. Massa tincidunt dui ut ornare lectus sit amet est placerat. Tortor at auctor urna nunc id cursus metus. Feugiat in ante metus dictum. Lectus magna fringilla urna porttitor rhoncus dolor purus non enim. Lacus viverra vitae congue eu. Congue eu consequat ac felis donec et. Nibh venenatis cras sed felis.",
    price: 234,
  ),
  Plant(
    label: 'Jolie',
    origin: "France",
    asset: "assets/images/image_3.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Et malesuada fames ac turpis egestas sed tempus urna. Tortor condimentum lacinia quis vel eros donec ac. Elementum nibh tellus molestie nunc non blandit massa enim. Amet risus nullam eget felis. Eget felis eget nunc lobortis. Ut diam quam nulla porttitor massa id. Id velit ut tortor pretium viverra suspendisse potenti. Eu augue ut lectus arcu bibendum at varius vel pharetra.Blandit aliquam etiam erat velit scelerisque in. Volutpat diam ut venenatis tellus in metus vulputate eu scelerisque. Vel orci porta non pulvinar. In vitae turpis massa sed elementum. Risus in hendrerit gravida rutrum quisque non tellus orci ac. Ut aliquam purus sit amet luctus venenatis. Curabitur gravida arcu ac tortor dignissim convallis aenean. Massa tincidunt dui ut ornare lectus sit amet est placerat. Tortor at auctor urna nunc id cursus metus. Feugiat in ante metus dictum. Lectus magna fringilla urna porttitor rhoncus dolor purus non enim. Lacus viverra vitae congue eu. Congue eu consequat ac felis donec et. Nibh venenatis cras sed felis.",
    price: 234,
  ),
].toList();

List<Plant> featuredData = [
  Plant(
    label: 'Linda',
    origin: "Ghana",
    asset: "assets/images/bottom_img_1.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Et malesuada fames ac turpis egestas sed tempus urna. Tortor condimentum lacinia quis vel eros donec ac. Elementum nibh tellus molestie nunc non blandit massa enim. Amet risus nullam eget felis. Eget felis eget nunc lobortis. Ut diam quam nulla porttitor massa id. Id velit ut tortor pretium viverra suspendisse potenti. Eu augue ut lectus arcu bibendum at varius vel pharetra.Blandit aliquam etiam erat velit scelerisque in. Volutpat diam ut venenatis tellus in metus vulputate eu scelerisque. Vel orci porta non pulvinar. In vitae turpis massa sed elementum. Risus in hendrerit gravida rutrum quisque non tellus orci ac. Ut aliquam purus sit amet luctus venenatis. Curabitur gravida arcu ac tortor dignissim convallis aenean. Massa tincidunt dui ut ornare lectus sit amet est placerat. Tortor at auctor urna nunc id cursus metus. Feugiat in ante metus dictum. Lectus magna fringilla urna porttitor rhoncus dolor purus non enim. Lacus viverra vitae congue eu. Congue eu consequat ac felis donec et. Nibh venenatis cras sed felis.",
    price: 234,
  ),
  Plant(
    label: 'Lola',
    origin: "USA",
    asset: "assets/images/bottom_img_2.png",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Et malesuada fames ac turpis egestas sed tempus urna. Tortor condimentum lacinia quis vel eros donec ac. Elementum nibh tellus molestie nunc non blandit massa enim. Amet risus nullam eget felis. Eget felis eget nunc lobortis. Ut diam quam nulla porttitor massa id. Id velit ut tortor pretium viverra suspendisse potenti. Eu augue ut lectus arcu bibendum at varius vel pharetra.Blandit aliquam etiam erat velit scelerisque in. Volutpat diam ut venenatis tellus in metus vulputate eu scelerisque. Vel orci porta non pulvinar. In vitae turpis massa sed elementum. Risus in hendrerit gravida rutrum quisque non tellus orci ac. Ut aliquam purus sit amet luctus venenatis. Curabitur gravida arcu ac tortor dignissim convallis aenean. Massa tincidunt dui ut ornare lectus sit amet est placerat. Tortor at auctor urna nunc id cursus metus. Feugiat in ante metus dictum. Lectus magna fringilla urna porttitor rhoncus dolor purus non enim. Lacus viverra vitae congue eu. Congue eu consequat ac felis donec et. Nibh venenatis cras sed felis.",
    price: 234,
  ),
].toList();

List<Plant> favouriteData = [
  ...recommendedData,
  ...featuredData,
  Plant(
      label: 'Nezuko',
      origin: "Japan",
      asset: "assets/images/img.png",
      price: 234,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit duis tristique sollicitudin. Et malesuada fames ac turpis egestas sed tempus urna. Tortor condimentum lacinia quis vel eros donec ac. Elementum nibh tellus molestie nunc non blandit massa enim. Amet risus nullam eget felis. Eget felis eget nunc lobortis. Ut diam quam nulla porttitor massa id. Id velit ut tortor pretium viverra suspendisse potenti. Eu augue ut lectus arcu bibendum at varius vel pharetra. Blandit aliquam etiam erat velit scelerisque in. Volutpat diam ut venenatis tellus in metus vulputate eu scelerisque. Vel orci porta non pulvinar. In vitae turpis massa sed elementum. Risus in hendrerit gravida rutrum quisque non tellus orci ac. Ut aliquam purus sit amet luctus venenatis. Curabitur gravida arcu ac tortor dignissim convallis aenean. Massa tincidunt dui ut ornare lectus sit amet est placerat. Tortor at auctor urna nunc id cursus metus. Feugiat in ante metus dictum. Lectus magna fringilla urna porttitor rhoncus dolor purus non enim. Lacus viverra vitae congue eu. Congue eu consequat ac felis donec et. Nibh venenatis cras sed felis."),
].toList();
