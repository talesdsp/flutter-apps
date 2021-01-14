import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget cachedImage(
    {@required String id, double size, Color color, String suffix = ""}) {
  return Hero(
    tag: id + suffix,
    child: CachedNetworkImage(
      height: size ?? 80,
      width: size ?? 80,
      color: color,
      placeholder: (context, url) => Container(
        color: Colors.transparent,
        height: size ?? 80,
      ),
      imageUrl:
          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$id.png',
    ),
  );
}
