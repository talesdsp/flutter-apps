import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/questions.dart';

import 'option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QuestionController _controller = Get.find();

    if (_controller.finished) {
      // Navigator.of(context).push(MaterialPageRoute())
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(
            this.question.question,
            style: Theme.of(context).textTheme.headline5.copyWith(
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 10),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              press: () {
                Get.find<QuestionController>(tag: 'score').numOfCorrectAnswers =
                    _controller.checkAnswer(question, index);

                _controller.animate();
              },
              text: this.question.options[index],
            ),
          )
        ],
      ),
    );
  }
}
