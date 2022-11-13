import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/firebase_references.dart';
import 'package:study_app/models/question_paper_model.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    print(_questionPaper.title);
    loadData(_questionPaper);
    super.onReady();
  }

  void loadData(QuestionPaperModel questionPaper) async {
    questionPaperModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();

      final questions = questionQuery.docs
          .map((snapshot) => Questions.fromSnapshot(snapshot))
          .toList();

      questionPaper.questions = questions;
      for (Questions _questions in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(_questions.id)
                .collection("answers")
                .get();

        final answers = answersQuery.docs
            .map((answer) => Answers.fromSnapshot(answer))
            .toList();

        _questions.answers = answers;

        if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaper.questions!);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
