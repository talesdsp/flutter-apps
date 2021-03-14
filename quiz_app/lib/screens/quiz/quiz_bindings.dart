import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class QuizBindings implements Bindings {
  @override
  void dependencies() {
    Get.create(() => QuestionController());
    Get.put(QuestionController(), tag: "score");
  }
}
