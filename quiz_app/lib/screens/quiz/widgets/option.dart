import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;

  const Option({
    Key key,
    @required this.index,
    @required this.press,
    @required this.text,
  }) : super(key: key);

  // final QuestionController _controller;

  // bool _isCorrect = this.index == _controller.correctAnswer;
  // bool _isWrong = this.index == _controller.selectedAnswer &&
  //     _controller.selectedAnswer != _controller.correctAnswer;

  // Color getTheRightColor() {
  //   if (_controller.isAnswered) {
  //     if (_isCorrect) {
  //       return kGreenColor;
  //     } else if (_isWrong) {
  //       return kRedColor;
  //     }
  //   }

  //   return kGrayColor;
  // }

  @override
  Widget build(BuildContext context) {
    final QuestionController _controller = Get.find();

    return GetBuilder<QuestionController>(
      builder: (_controller) {
        return Padding(
          padding: const EdgeInsets.only(top: kDefaultPadding),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: this.press,
              child: Ink(
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: getTheRightColor(),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${this.index + (1)}. $text",
                      style: TextStyle(
                        color: getTheRightColor(),
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      height: 26,
                      width: 26,
                      decoration: BoxDecoration(
                        color: getTheRightColor(),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: getTheRightColor()),
                      ),
                      child: getTheRightColor() == kGrayColor
                          ? null
                          : Icon(
                              _isCorrect ? Icons.check : Icons.close,
                              size: 16,
                            ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
