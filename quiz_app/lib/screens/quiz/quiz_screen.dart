import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/widgets/progress_bar.dart';
import 'package:quiz_app/screens/quiz/widgets/question_card.dart';
import 'package:websafe_svg/websafe_svg.dart';

class QuizScreen extends GetView<QuestionController> {
  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = controller;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text("Skip"),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ProgressBar(),
                ),
                SizedBox(height: kDefaultPadding),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Obx(() => Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "Question ${_questionController.questionNumber}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: kSecondaryColor),
                            ),
                            TextSpan(
                              text: '/${_questionController.question.length}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .copyWith(color: kSecondaryColor),
                            )
                          ],
                        ),
                      )),
                ),
                Divider(thickness: 1.5),
                SizedBox(height: kDefaultPadding),
                Expanded(
                  child: PageView.builder(
                    physics: _questionController.finished
                        ? ClampingScrollPhysics()
                        : NeverScrollableScrollPhysics(),
                    onPageChanged: _questionController.pageListener,
                    controller: _questionController.pageController,
                    itemCount: _questionController.question.length,
                    itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.question[index],
                    ),
                  ),
                ),
                SizedBox(height: kDefaultPadding),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
