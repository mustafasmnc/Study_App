import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/firebase_references.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/models/question_paper_model.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.loading.obs;

  void uploadData() async {
    try {
      loadingStatus.value = LoadingStatus.loading;
      final fireStore = FirebaseFirestore.instance;

      final manifestContent = await DefaultAssetBundle.of(Get.context!)
          .loadString("AssetManifest.json");

      final Map<String, dynamic> manifestMap = json.decode(manifestContent);
      //load json file and print path
      final papersInAssets = manifestMap.keys
          .where((path) =>
              path.startsWith("assets/DB/paper") && path.contains(".json"))
          .toList();

      List<QuestionPaperModel> questionPapers = [];
      for (var paper in papersInAssets) {
        String stringPaperContent = await rootBundle.loadString(paper);
        questionPapers
            .add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
      }
      //print('items number: ${questionPapers[0].id}');

      var batch = fireStore.batch();

      for (var paper in questionPapers) {
        batch.set(questionPaperRF.doc(paper.id), {
          "title": paper.title,
          "image_url": paper.imageUrl,
          "description": paper.description,
          "timeSeconds": paper.timeSeconds,
          "questions_count":
              paper.questions == null ? 0 : paper.questions!.length
        });

        for (var questions in paper.questions!) {
          final questionPath =
              questionRF(paperId: paper.id, questionId: questions.id);
          batch.set(questionPath, {
            "question": questions.question,
            "correct_answer": questions.correctAnswer
          });

          for (var answer in questions.answers) {
            batch.set(questionPath.collection("answers").doc(answer.identifier),
                {"identifier": answer.identifier, "answer": answer.answer});
          }
        }
      }

      await batch.commit();
      loadingStatus.value = LoadingStatus.completed;
    } catch (e) {
      loadingStatus.value = LoadingStatus.error;
      print(e);
    }
  }
}
