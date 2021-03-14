import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class WelcomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuestionController());
  }
}
