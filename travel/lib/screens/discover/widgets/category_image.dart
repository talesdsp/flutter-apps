// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class CategoryImage extends StatelessWidget {

//   const CategoryImage({});

//   final dynamic
//   @override
//   Widget build(BuildContext context) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 15),
//     child: AspectRatio(
//       aspectRatio: 1,
//       child: Hero(
//         tag: destination.imageUrl,
//         child: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage(destination.imageUrl),
//               fit: BoxFit.cover,
//               colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
//             ),
//             borderRadius: BorderRadius.circular(25),
//             boxShadow: [
//               const BoxShadow(
//                 color: Colors.black38,
//                 blurRadius: 10,
//                 offset: Offset(0, 4),
//               ),
//             ],
//           ),
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Text(
//                 destination.city,
//                 style: Theme.of(context).textTheme.headline5.copyWith(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     letterSpacing: 1.1),
//               ),
//               Row(
//                 children: [
//                   FaIcon(
//                     FontAwesomeIcons.locationArrow,
//                     size: 14,
//                     color: Colors.white70,
//                   ),
//                   SizedBox(width: 5),
//                   Text(
//                     destination.country,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText1
//                         .copyWith(color: Colors.white54),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
//   }
// }
