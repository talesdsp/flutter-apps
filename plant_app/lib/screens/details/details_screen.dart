import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';
import 'package:plant_app/screens/payment/payment_screen.dart';

import 'widgets/description_body.dart';
import 'widgets/main_body.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key key, this.plant}) : super(key: key);

  final Plant plant;

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  PageController _pageController;

  String _text = "Description";

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/more.svg"),
              onPressed: () {},
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: _pageController,
              children: [
                MainBody(
                  size: _size,
                  plant: this.widget.plant,
                ),
                DescriptionBody(
                  size: _size,
                  plant: this.widget.plant,
                )
              ],
            ),
          ),
          SizedBox(
            height: 70,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(40)),
                    color: kPrimaryColor,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => PaymentScreen(),
                          ),
                        );
                      },
                      child: Ink(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Material(
                    clipBehavior: Clip.hardEdge,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(40)),
                    child: InkWell(
                      onTap: () {
                        if (_pageController.page == 0.0) {
                          setState(() {
                            _text = "Overview";
                          });
                          _pageController.nextPage(
                            curve: Curves.easeOut,
                            duration: Duration(milliseconds: 200),
                          );
                        } else {
                          setState(() {
                            _text = "Description";
                          });
                          _pageController.previousPage(
                            curve: Curves.easeOut,
                            duration: Duration(milliseconds: 200),
                          );
                        }
                      },
                      child: Ink(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            _text,
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// void _showDescriptionDialog(BuildContext context, Plant plant) {
//   Widget _descriptionDialog(BuildContext ctx) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 3,
//           child: Container(
//             color: Colors.white,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(kDefaultPadding),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       plant.label,
//                       style: Theme.of(context)
//                           .textTheme
//                           .headline4
//                           .copyWith(color: kTextColor),
//                     ),
//                     SizedBox(height: 20),
//                     Text(
//                       plant.description,
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyText2
//                           .copyWith(color: kTextColor),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Spacer(flex: 1),
//         OutlineButton(
//           child: Ink(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 50,
//                 vertical: 20,
//               ),
//               child: Text("Close")),
//           textColor: Colors.white,
//           splashColor: kPrimaryColor,
//           highlightedBorderColor: Colors.white,
//           borderSide: BorderSide(color: Colors.white),
//           onPressed: () {
//             Navigator.pop(ctx);
//           },
//         ),
//         Spacer(flex: 1),
//       ],
//     );
//   }

//   showDialog(context: context, builder: (ctx) => _descriptionDialog(ctx));
// }
