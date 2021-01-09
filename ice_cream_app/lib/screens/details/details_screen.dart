import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ice_cream_app/constants.dart';
import 'package:ice_cream_app/model/product.dart';
import 'package:ice_cream_app/screens/details/widgets/checkout.dart';
import 'package:ice_cream_app/screens/details/widgets/nutritional_info.dart';
import 'package:ice_cream_app/screens/details/widgets/shopping_card.dart';
import 'package:ice_cream_app/utils/contrast.dart';
import 'package:ice_cream_app/widgets/top_buttons.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;
  DetailsScreen({Key key, @required this.product}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int units = 1;
  String selectedSize = "M";
  Color color;

  @override
  void initState() {
    setState(() {
      color = getContrastColor(widget.product.primary);
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: widget.product.secondary,
    ));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPink,
    ));
  }

  void _increment() {
    if (units < 10) {
      setState(() {
        units += 1;
      });
    }
  }

  void _decrement() {
    if (units >= 2) {
      setState(() {
        units -= 1;
      });
    }
  }

  void _selectSize(String size) {
    setState(() {
      selectedSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        top: true,
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TopButtons(
              leftIcon: Icons.keyboard_backspace,
              rightIcon: Icons.shopping_basket,
              theme: 'market',
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${widget.product.flavor}\nIce Cream',
                    style: GoogleFonts.lobster(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      color: widget.product.secondary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NutritionalInfo(
                    product: widget.product,
                  ),
                  ShoppingCard(
                    product: widget.product,
                    units: units,
                    increment: _increment,
                    decrement: _decrement,
                    selectSize: _selectSize,
                    selectedSize: selectedSize,
                    contrast: color,
                  ),
                ],
              ),
            ),
            Checkout(
              price: widget.product.price,
              units: units,
              primary: widget.product.primary,
              color: widget.product.secondary,
              contrast: color,
            ),
          ],
        ),
      ),
    );
  }
}
