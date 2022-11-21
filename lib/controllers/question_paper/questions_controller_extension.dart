import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/questions_controller.dart';

import '../../firebase_ref/firebase_references.dart';
import '../auth/auth_controller.dart';

extension QuestionsControllerExtension on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} are correct!';
  }

  String get points {
    // var points = (correctQuestionCount / allQuestions.length) *
    //     100 *
    //     (questionPaperModel.timeSeconds - remainSeconds) /
    //     questionPaperModel.timeSeconds *
    //     100;
    var points = (correctQuestionCount / allQuestions.length) * 100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResult() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();

    if (_user == null) return;
    batch.set(
        userRF
            .doc(_user.email)
            .collection('recent_tests')
            .doc(questionPaperModel.id),
        {
          "points": points,
          "correct_answer": "$correctQuestionCount/${allQuestions.length}",
          "question_id": questionPaperModel.id,
          "time": questionPaperModel.timeSeconds - remainSeconds
        });
    batch.commit();
    navigateToHome();
  }
}
