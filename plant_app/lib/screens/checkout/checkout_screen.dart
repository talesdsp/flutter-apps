import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/plant.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key key, this.item}) : super(key: key);

  final Plant item;

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvSecret = false;
  bool isCvvFocused = false;
  bool isCardNumberSecret = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                ),
                CreditCardForm(
                  onCreditCardModelChange: onCreditCardModelChange,
                  themeColor: kPrimaryColor,
                ),
                SizedBox(height: 40),
                Material(
                  borderRadius: BorderRadius.circular(12),
                  color: kPrimaryColor,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.white24,
                    onTap: () {},
                    child: Ink(
                      height: 50,
                      width: 120,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text('Confirm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
