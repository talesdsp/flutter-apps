import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questions.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  QuestionController() : super();

  AnimationController _animationController;
  Animation _animation;
  Animation get animation => this._animation;

  PageController _pageController;

  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

  List<Question> get question => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAnswer;
  int get correctAnswer => this._correctAnswer;

  int _selectedAnswer;
  int get selectedAnswer => this._selectedAnswer;

  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAnswers = 0;
  int get numOfCorrectAnswers => this._numOfCorrectAnswers;
  set numOfCorrectAnswers(int number) => this._numOfCorrectAnswers = number;

  bool _lastPage = false;

  bool _finished = false;
  bool get finished => _finished;

  void pageListener(int index) {
    _lastPage = index == (this._questions.length - 1);
    _questionNumber.value = index + 1;
  }

  void _finishQuiz() {
    _finished = true;
    Get.toNamed('/score');
  }

  int checkAnswer(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAnswer = question.answer;
    _selectedAnswer = selectedIndex;

    if (_correctAnswer == _selectedAnswer) {
      _numOfCorrectAnswers++;
    }
    return _numOfCorrectAnswers;
  }

  void animate() {
    Future.delayed(Duration(milliseconds: 600), () {
      if (_lastPage) {
        _animationController.stop();
        _finishQuiz();
        return;
      }

      _pageController.nextPage(
        curve: Curves.ease,
        duration: Duration(milliseconds: 250),
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    _pageController = PageController();

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(_finishQuiz);
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }
}
